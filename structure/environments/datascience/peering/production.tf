# Atlas Data-Science Environment - VPC Peering Resources - Production

# inject routes to the production environment to all private route tables in data-science
resource "aws_route" "prod" {
  count = 15

  route_table_id = "${var.private_route_table_ids[count.index]}"
  destination_cidr_block = "${var.env_prod_cidr_block}"
  vpc_peering_connection_id = "${var.prod_peering_connection_id}"
}
