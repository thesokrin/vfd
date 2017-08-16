# Atlas Stack - Routing

# create a summary route to the internet gateway for the three DMZ subnets
resource "aws_route" "dmz_wan" {
  count = 3
  route_table_id = "${module.dmz.route_table_ids[count.index]}"
  gateway_id = "${aws_internet_gateway.internet_gateway.id}"
  destination_cidr_block = "0.0.0.0/0"
}
