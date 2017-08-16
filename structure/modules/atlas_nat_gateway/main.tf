# Atlas NAT Gateway

# resources
# nat gateway for each dmz subnet
resource "aws_nat_gateway" "nat" {
  count = 3
  allocation_id = "${element(aws_eip.nat.*.id, count.index)}"
  subnet_id = "${var.dmz_subnet_ids[count.index]}"
}

# elastic ip allocation for each nat gateway
resource "aws_eip" "nat" {
  count = 3
  vpc = true
}

# create summary nat routes for all private subnets
resource "aws_route" "nat" {
  count = 15
  route_table_id = "${var.private_route_table_ids[count.index]}"
  nat_gateway_id = "${element(aws_nat_gateway.nat.*.id, count.index % 3)}"
  destination_cidr_block = "0.0.0.0/0"
}
