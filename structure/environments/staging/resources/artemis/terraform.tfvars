# Atlas Staging Environment - Artemis Resources - Configuration

aws_region = "us-east-1"
aws_account_id = "886703752586"

cidr_block = "10.51.0.0/16"

env_name = "staging"
env_name_fancy = "Atlas Staging Environment"
env_name_short = "stg"

hub_cidr_block = "10.10.0.0/16"

lahq_cidr_block = "10.40.0.0/21"

layer_dmz_cidr_blocks = [
  "10.51.1.0/24",
  "10.51.2.0/24",
  "10.51.3.0/24"
]

layer_public_cidr_blocks = [
  "10.51.20.0/23",
  "10.51.22.0/23",
  "10.51.24.0/23"
]

layer_public_subnet_ids = [
  "subnet-3607477f",
  "subnet-4fbb3014",
  "subnet-00c4552d"
]

layer_services_cidr_blocks = [
  "10.51.30.0/23",
  "10.51.32.0/23",
  "10.51.34.0/23"
]

private_zone_id = "Z1LQ8GB9CX2UQF"

realtime_elb_id = ""

vpc_id = "vpc-054e9f63"

web_elb_id = ""

zone = "stg.grindr.io"
capacity = "1"
