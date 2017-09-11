# Legacy Layer Macro

module "layer" {
  source = "../../modules/atlas_layer"
  # variables
  name = "legacy"
  cidr_mask_bits = 7
  cidr_start = 30

  stack_vpc_id = "${var.vpc_id}"
  stack_cidr_block = "${var.cidr_block}"
  stack_zone = "${var.zone}"
}

# inject NAT routes
# these must be defined here due to the TF count bug
resource "aws_route" "layer_chat_nat" {
  count = 3

  destination_cidr_block = "0.0.0.0/0"
  route_table_id = "${module.layer.route_table_ids[count.index]}"
  nat_gateway_id = "${var.nat_gateway_ids[count.index]}"
}

# inject VPC peer routes
resource "aws_route" "layer_chat_vpc_peer" {
  count = 3

  destination_cidr_block = "${var.hub_cidr_block}"
  route_table_id = "${module.layer.route_table_ids[count.index]}"
  vpc_peering_connection_id = "${var.vpc_peering_connection_id}"
}
