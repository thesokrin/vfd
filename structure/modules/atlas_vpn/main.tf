# Atlas VPN

resource "aws_vpn_gateway" "vpn_gateway" {
    vpc_id = "${var.vpc_id}"

    tags {
      Name = "${var.zone}"
      atlas_zone = "${var.zone}"
    }
}

resource "aws_customer_gateway" "customer_gateway" {
  type = "ipsec.1"
  ip_address = "${var.vpn_destination}"
  bgp_asn = "${var.bgp_asn}"

  tags {
    Name = "${var.zone}"
    atlas_zone = "${var.zone}"
  }
}

resource "aws_vpn_connection" "main" {
  vpn_gateway_id = "${aws_vpn_gateway.vpn_gateway.id}"
  customer_gateway_id = "${aws_customer_gateway.customer_gateway.id}"
  type = "ipsec.1"

  tags {
    Name = "${var.zone}"
    atlas_zone = "${var.zone}"
  }
}

resource "aws_route" "vpn" {
  count = 15

  destination_cidr_block = "${var.vpn_cidr_block}"
  route_table_id = "${var.route_table_ids[count.index]}"
  gateway_id = "${aws_vpn_gateway.vpn_gateway.id}"

  lifecycle {
    create_before_destroy = true
  }
}
