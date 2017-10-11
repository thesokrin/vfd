# Atlas Hub 1 - Redis Resources - State Variables

availability_zones = [
  "us-east-1a",
  "us-east-1b",
  "us-east-1d",
]

# Ubuntu latest 14.04 lts hvm, ssd ebs
aws_ami = "ami-1081b807"

# 2.0 account id
aws_account_id = "284224159432"

aws_region = "us-east-1"

ec2_instance_type = "r3.2xlarge"

hub_cidr_block = "10.10.0.0/16"

hub_id = "10"

hub_name = "hub"

hub_name_short = "hub"

key_name = "isre-shared"

lahq_cidr_block = "10.40.0.0/21"

layer_admin_cidr_blocks = [
  "10.10.10.0/23",
  "10.10.12.0/23",
  "10.10.14.0/23",
]

layer_data_cidr_blocks = [
  "10.10.40.0/23",
  "10.10.42.0/23",
  "10.10.44.0/23",
]

layer_services_cidr_blocks = [
  "10.10.30.0/23",
  "10.10.32.0/23",
  "10.10.34.0/23",
]

layer_data_subnet_ids = [
  "subnet-b3f394fa",
  "subnet-755ff72e",
  "subnet-4839e874",
]

private_zone_id = "Z1RCUXX7W0A26O"

reverse_zone_id = "Z3DN439AXT68NJ"

vpc_id = "vpc-62e70f04"

zone = "hub.grindr.io"
