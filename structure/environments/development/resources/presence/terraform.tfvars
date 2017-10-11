aws_account_id = "202004573189"

aws_region = "us-east-1"

ebs_root_volume_size = 32

ebs_root_volume_type = "gp2"

ec2_ami_id = "ami-9c9d3b8a"

ec2_instance_type = "c4.2xlarge"

ec2_key_name = "isre-shared"

env_cidr_block = "10.50.0.0/16"

env_name = "development"

env_name_fancy = "Atlas Development Environment"

env_name_short = "dev"

hub_cidr_block = "10.10.0.0/16"

lahq_cidr_block = "10.40.0.0/21"

layer_dmz_cidr_blocks = [
  "10.50.1.0/24",
  "10.50.2.0/24",
  "10.50.3.0/24",
]

layer_dmz_subnet_ids = [
  "subnet-00593949",
  "subnet-68b00533",
  "subnet-be4bfa93",
]

layer_public_cidr_blocks = [
  "10.50.20.0/23",
  "10.50.22.0/23",
  "10.50.24.0/23",
]

layer_services_cidr_blocks = [
  "10.50.30.0/23",
  "10.50.32.0/23",
  "10.50.34.0/23",
]

layer_services_subnet_ids = [
  "subnet-1559395c",
  "subnet-1ab00541",
  "subnet-8c4bfaa1",
]

presence_auth_host = "loadtest-api.preprod1.grindr.com"

project_name = "presence"

project_name_fancy = "Presence"

project_owner = "chat"

public_zone_id = "Z8XZ5736MQ6A4"

private_zone_id = "ZH2Y70RD294AJ"

reverse_zone_id = "Z2KY29K93KM131"

vpc_id = "vpc-d3de2bb5"

wildcard_certificate_arn = "arn:aws:acm:us-east-1:202004573189:certificate/1f39026c-d526-4c71-abc3-adb1833e0636"

zone = "dev.grindr.io"
