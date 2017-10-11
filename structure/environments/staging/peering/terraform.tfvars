# Atlas Staging Environment - Peering Resources - Configuration

aws_region = "us-east-1"
aws_account_id = "886703752586"

vpc_id = "vpc-054e9f63"
zone = "stg.grindr.io"

private_route_table_ids = [
  "rtb-870f03e1",
  "rtb-960f03f0",
  "rtb-8e0f03e8",
  "rtb-860f03e0",
  "rtb-840f03e2",
  "rtb-890f03ef",
  "rtb-970f03f1",
  "rtb-940f03f2",
  "rtb-920f03f4",
  "rtb-930f03f5",
  "rtb-900f03f6",
  "rtb-910f03f7",
  "rtb-850f03e3",
  "rtb-8b0f03ed",
  "rtb-880f03ee"
]
public_route_table_ids = [
  "rtb-9d0f03fb",
  "rtb-9e0f03f8",
  "rtb-9c0f03fa"
]

env_preprod_account_id = "202004573189"
env_preprod_zone = "dev.grindr.io"
# chat in preprod specific vpc/cidr blocks
env_preprod_vpc_id = "vpc-c984f5ad"
env_preprod_cidr_block = "10.1.0.0/16"
