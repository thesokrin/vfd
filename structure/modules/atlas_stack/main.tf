# Atlas Stack
# An abstraction for the shared resources between Atlas Environments and an Atlas Hub.

data "aws_region" "current" {
  current = true
}

data "aws_caller_identity" "current" {}

# vpc
resource "aws_vpc" "vpc" {
  cidr_block = "10.${var.id}.0.0/16"
  instance_tenancy = "default"

  enable_dns_hostnames = true
  enable_dns_support = true

  tags {
    Name = "${var.zone}"
    atlas_zone = "${var.zone}"
  }
}

# dhcp options set
resource "aws_vpc_dhcp_options" "dhcp_options" {
  domain_name = "${var.zone}"
  domain_name_servers = ["AmazonProvidedDNS"]
  ntp_servers = []
  netbios_name_servers = []
  netbios_node_type = 2

  tags {
    Name = "${var.zone}"
    atlas_zone = "${var.zone}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_vpc_dhcp_options_association" "dhcp_options_assoc" {
  vpc_id = "${aws_vpc.vpc.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.dhcp_options.id}"
}

# vpc endpoint to local region s3
resource "aws_vpc_endpoint" "s3" {
    vpc_id = "${aws_vpc.vpc.id}"
    service_name = "com.amazonaws.${data.aws_region.current.name}.s3"
    route_table_ids = ["${concat(module.dmz.route_table_ids, module.admin.route_table_ids, module.public.route_table_ids, module.services.route_table_ids, module.data.route_table_ids, module.net.route_table_ids)}"]
}

# internet gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.zone}"
    atlas_zone = "${var.zone}"
  }
}

resource "aws_route53_delegation_set" "public" {
  reference_name = "${var.zone}"
}

# dns hosted zones (public and private for split-horizon DNS)
resource "aws_route53_zone" "public" {
  name = "${var.zone}"
  delegation_set_id = "${aws_route53_delegation_set.public.id}"

  tags {
    Name = "${var.zone} public zone"
    atlas_zone = "${var.zone}"
    atlas_dns_horizon = "public"
  }
}

resource "aws_route53_zone" "private" {
  name = "${var.zone}"
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.zone} private zone"
    atlas_zone = "${var.zone}"
    atlas_dns_horizon = "private"
  }
}

resource "aws_route53_zone" "reverse" {
  name = "${var.id}.10.in-addr.arpa"
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.zone} reverse zone"
    atlas_zone = "${var.zone}"
    atlas_dns_horizon = "private"
  }
}
