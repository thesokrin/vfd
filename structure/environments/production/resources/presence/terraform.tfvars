aws_account_id = "058144102190"
aws_region = "us-east-1"

ec2_instance_type = "c4.8xlarge"

env_cidr_block = "10.2.0.0/16"

env_name = "production"
env_name_fancy = "Atlas Production Environment"
env_name_short = "prod"

hub_cidr_block = "10.10.0.0/16"
lahq_cidr_block = "10.40.0.0/21"

layer_dmz_cidr_blocks = [
  "10.2.1.0/24",
  "10.2.2.0/24",
  "10.2.3.0/24"
]

layer_dmz_subnet_ids = [
  "subnet-91ffc1d8",
  "subnet-f64601ad",
  "subnet-579dd47a"
]

layer_public_cidr_blocks = [
  "10.2.20.0/23",
  "10.2.22.0/23",
  "10.2.24.0/23"
]

layer_services_cidr_blocks = [
  "10.2.30.0/23",
  "10.2.32.0/23",
  "10.2.34.0/23"
]

layer_services_subnet_ids = [
  "subnet-93ffc1da",
  "subnet-ea4601b1",
  "subnet-569dd47b"
]

presence_auth_host = "neo-auth.grindr.com"

private_zone_id = "Z2R2BOBPMOS28B"
public_zone_id = "Z1HPEFOO7APF4D"
reverse_zone_id = "Z38JFD4LMHKUJP"

vpc_id = "vpc-a5ac3fc3"

wildcard_certificate_arn = "arn:aws:iam::058144102190:server-certificate/STAR.grindr.com-2017-07-11-2020-07-21"

zone = "prod.grindr.io"
