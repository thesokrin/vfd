asg_capacity = 1

aws_region = "us-east-1"

ec2_ami_id = "ami-9c9d3b8a"

# pin to the 2.0 account
aws_account_id = "284224159432"

env_name = "hub"
env_name_fancy = "Atlas Hub Environment"
env_name_short = "hub"

ec2_key_name = "isre-shared"
ec2_instance_type = "c4.2xlarge"

ebs_root_volume_size = 32
ebs_root_volume_type = "gp2"

hub_name = "hub"
cidr_block = "10.10.0.0/16"
hub_cidr_block = "10.10.0.0/16"
lahq_cidr_block = "10.40.0.0/21"

layer_dmz_cidr_blocks = [
  "10.10.1.0/24",
  "10.10.2.0/24",
  "10.10.3.0/24"
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

layer_public_subnet_ids = [
  "subnet-b1f394f8",
  "subnet-775ff72c",
  "subnet-4e39e872"
]

vpc_id = "vpc-62e70f04"

zone = "hub.grindr.io"
private_zone_id = "Z1RCUXX7W0A26O"

realtime_elb_id = "atlas-hub-realtime"
web_elb_id = "atlas-hub-web"
