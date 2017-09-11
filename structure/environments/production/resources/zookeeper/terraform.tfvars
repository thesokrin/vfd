aws_account_id = "058144102190"
aws_region = "us-east-1"

additional_exhibitor_cidr_blocks = [
  # hub admin layer
  "10.10.10.0/23",
  "10.10.12.0/23",
  "10.10.14.0/23",
  # hub public layer for artemis
  "10.10.20.0/23",
  "10.10.22.0/23",
  "10.10.24.0/23"
]

additional_zookeeper_cidr_blocks = [
  # hub admin layer
  "10.10.10.0/23",
  "10.10.12.0/23",
  "10.10.14.0/23"
]

artemis_sg_id = "sg-de0b9fa2"

cidr_block = "10.2.0.0/16"

layer_admin_subnet_ids = [
  "subnet-9effc1d7",
  "subnet-f44601af",
  "subnet-519dd47c"
]

layer_admin_cidr_blocks = [
  "10.2.10.0/23",
  "10.2.12.0/23",
  "10.2.14.0/23"
]

layer_data_cidr_blocks = [
  "10.2.40.0/23",
  "10.2.42.0/23",
  "10.2.44.0/23"
]

layer_services_cidr_blocks = [
  "10.2.30.0/23",
  "10.2.32.0/23",
  "10.2.34.0/23"
]

private_zone_id = "Z2R2BOBPMOS28B"

reverse_zone_id = "Z38JFD4LMHKUJP"

env_name = "production"

env_name_short = "prod"

env_name_fancy = "Atlas Production Environment"

vpc_id = "vpc-a5ac3fc3"

zone = "prod.grindr.io"
