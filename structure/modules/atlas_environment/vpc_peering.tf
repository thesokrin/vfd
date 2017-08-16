# Atlas Environment - VPC Peering Setup

resource "aws_vpc_peering_connection" "hub" {
  vpc_id = "${module.stack.vpc_id}"

  peer_owner_id = "${var.hub_account_id}"
  peer_vpc_id = "${var.hub_vpc_id}"

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags {
    Name = "${module.stack.zone}:${var.hub_zone}"
    atlas_zone = "${module.stack.zone}"
    atlas_environment = "${var.name}"
    atlas_hub = "${var.hub_zone}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route" "hub" {
  count = 15

  route_table_id = "${module.stack.private_route_table_ids[count.index]}"
  destination_cidr_block = "${var.hub_cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.hub.id}"
}
