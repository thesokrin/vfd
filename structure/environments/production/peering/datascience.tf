# Atlas Production Environment - VPC Peering Resources - Data-Science Peering

resource "aws_vpc_peering_connection" "datascience" {
  vpc_id = "${var.vpc_id}"

  peer_owner_id = "${var.env_dsci_account_id}"
  peer_vpc_id = "${var.env_dsci_vpc_id}"

  auto_accept = true # because we're in the same account

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags {
    Name = "${var.zone}:${var.env_dsci_zone}"
    atlas_zone = "${var.zone}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# routes from prod to datascience
resource "aws_route" "datascience" {
  count = 15

  route_table_id = "${var.private_route_table_ids[count.index]}"
  destination_cidr_block = "${var.env_dsci_cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.datascience.id}"
}
