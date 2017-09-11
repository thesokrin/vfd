# Atlas Hub - Peering Resources - VPC Peering Connection Accepters

resource "aws_vpc_peering_connection_accepter" "environment" {
  count = "${length(var.environments)}"

  vpc_peering_connection_id = "${var.vpc_peering_connections[var.environments[count.index]]}"
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  tags {
    Name = "${var.zones[var.environments[count.index]]}:${var.zones["hub"]}"
    atlas_zone = "${var.zones[var.environments[count.index]]}"
    atlas_environment = "${var.environment_names[var.environments[count.index]]}"
    atlas_account_id = "${var.aws_account_ids[var.environments[count.index]]}"
  }
}

resource "aws_route" "environment" {
  count = "${length(var.environments) * length(var.private_route_table_ids)}"

  # we are going to iterate over all of the route tables once for each environment
  route_table_id = "${var.private_route_table_ids[
    count.index % length(var.private_route_table_ids)
  ]}"

  # this logic makes it so that the first iteration over the route tables fetches values from the first environment, etc.
  # the actual equation is:
  #
  #   let i = count.index
  #   let rt_len = length(var.private_route_table_ids)
  #   let env_len = length(var.environments)
  #   let rt_i = i % rt_len
  #   let env = var.environments[(i - rt_i) / rt_len % env_len]
  #

  # select the environment's cidr block
  destination_cidr_block = "${var.cidr_blocks[
    var.environments[
      (count.index - (count.index % length(var.private_route_table_ids))) / length(var.private_route_table_ids) % length(var.environments)
    ]
  ]}"

  # select the environment's vpc peering connection
  vpc_peering_connection_id = "${var.vpc_peering_connections[
    var.environments[
      (count.index - (count.index % length(var.private_route_table_ids))) / length(var.private_route_table_ids) % length(var.environments)
    ]
  ]}"
}
