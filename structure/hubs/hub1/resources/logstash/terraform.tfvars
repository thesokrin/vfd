# Atlas Hub - Logstash Resources - State Variables

asg_capacity = 6

availability_zones = [
  "us-east-1a",
  "us-east-1b",
  "us-east-1d",
]

# Grindr2-Prod account id
aws_account_id = "284224159432"

# atlas-trusty-stable-2017-03-07T18-45-01Z
aws_ami = "ami-9c9d3b8a"

ebs_root_volume_size = 32

ebs_root_volume_type = "gp2"

ec2_instance_type = "t2.large"

ec2_key_name = "isre-shared"

hub_cidr_block = "10.10.0.0/16"

hub_id = "10"

hub_name = "hub"

hub_name_short = "hub"

lahq_cidr_block = "10.40.0.0/21"

layer_admin_cidr_blocks = [
  "10.10.10.0/23",
  "10.10.12.0/23",
  "10.10.14.0/23",
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

private_zone_id = "Z1RCUXX7W0A26O"

reverse_zone_id = "Z3DN439AXT68NJ"

vpc_id = "vpc-62e70f04"

zone = "hub.grindr.io"
