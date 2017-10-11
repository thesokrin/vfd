# Atlas Staging Environment - VPC Peering Resources - Preprod Peering

resource "aws_vpc_peering_connection" "preprod" {
  vpc_id = "${var.vpc_id}"

  peer_owner_id = "${var.env_preprod_account_id}"
  peer_vpc_id = "${var.env_preprod_vpc_id}"

  auto_accept = false # because we're not in the same account

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags {
    Name = "${var.zone}:${var.env_preprod_zone}"
    atlas_zone = "${var.zone}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# routes from staging to preprod
resource "aws_route" "preprod" {
  count = "${length(concat(var.private_route_table_ids, var.public_route_table_ids))}"

  route_table_id = "${element(concat(var.private_route_table_ids, var.public_route_table_ids), count.index)}"
  destination_cidr_block = "${var.env_preprod_cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.preprod.id}"
}
