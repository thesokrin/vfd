aws_account_id = "284224159432"
aws_region = "us-east-1"

ec2_instance_count = 1

cidr_block = "10.10.0.0/16"

lahq_cidr_block = "10.40.0.0/21"

layer_admin_cidr_blocks = [
  "10.10.10.0/23",
  "10.10.12.0/23",
  "10.10.14.0/23",
]

layer_public_cidr_blocks = [
  "10.10.20.0/23",
  "10.10.22.0/23",
  "10.10.24.0/23"
]

layer_services_cidr_blocks = [
  "10.10.30.0/23",
  "10.10.32.0/23",
  "10.10.34.0/23",
]

layer_services_subnet_ids = [
  "subnet-baf394f3",
  "subnet-7f5ff724",
  "subnet-4f39e873",
]

env_name = "hub"
env_name_short = "hub"
env_name_fancy = "Atlas Hub"

vpc_id = "vpc-62e70f04"
