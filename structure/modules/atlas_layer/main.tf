# Atlas Layer

data "aws_region" "current" {
  current = true
}

data "aws_caller_identity" "current" {}

# resources
# one subnet per availability zone, with exactly three availability zones hardcoded
resource "aws_subnet" "layer" {
  count = 3
  vpc_id = "${var.stack_vpc_id}"
  availability_zone = "${element(var.availability_zones["${data.aws_caller_identity.current.account_id}.${data.aws_region.current.name}"], count.index)}"
  # create a cidr block within the stack's /16 of a given size
  cidr_block = "${cidrsubnet("${var.stack_cidr_block}", var.cidr_mask_bits, var.cidr_start + count.index)}"
  map_public_ip_on_launch = "${var.is_dmz}"

  # tags
  tags {
    Name = "${var.name}-${count.index}@${var.stack_zone}"
    atlas_layer = "${lower(var.name)}"
    atlas_zone = "${var.stack_zone}"
  }
}

# one single network acl attached to all three subnets
resource "aws_network_acl" "layer" {
  vpc_id = "${var.stack_vpc_id}"
  subnet_ids = ["${aws_subnet.layer.*.id}"]

  # tags
  tags {
    Name = "${var.name}@${var.stack_zone}"
    atlas_layer = "${lower(var.name)}"
    atlas_zone = "${var.stack_zone}"
  }
}

# one route table per subnet, due to different NAT routes per AZ
resource "aws_route_table" "layer" {
  count = 3
  vpc_id = "${var.stack_vpc_id}"

  # tags
  tags {
    Name = "${var.name}-${count.index}@${var.stack_zone}"
    atlas_layer = "${lower(var.name)}"
    atlas_zone = "${var.stack_zone}"
  }
}

resource "aws_route_table_association" "layer" {
  count = 3
  subnet_id = "${element(aws_subnet.layer.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.layer.*.id, count.index)}"
}
