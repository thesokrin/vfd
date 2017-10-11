artemis_sg_id = "sg-de0b9fa2"

additional_kafka_cidr_blocks = [
  # hub admin layer
  "10.10.10.0/23",
  "10.10.12.0/23",
  "10.10.14.0/23",
  # hub public layer for artemis
  "10.10.20.0/23",
  "10.10.22.0/23",
  "10.10.24.0/23"
]

additional_manager_cidr_blocks = [
  # hub public layer for artemis
  "10.10.20.0/23",
  "10.10.22.0/23",
  "10.10.24.0/23"
]

aws_region = "us-east-1"
aws_account_id = "058144102190"

name = "kafka"
project_name = "kafka"
role_package = "grindr-role-kafka"

env_name = "production"
env_name_short = "prod"
env_name_fancy = "Atlas Production Environment"

ec2_instance_count = 5
ec2_instance_type = "r3.2xlarge"

vpc_id = "vpc-a5ac3fc3"
zone = "prod.grindr.io"
cidr_block = "10.2.0.0/16"

private_zone_id = "Z2R2BOBPMOS28B"
reverse_zone_id = "Z38JFD4LMHKUJP"

layer_data_subnet_ids = [
  "subnet-9cffc1d5",
  "subnet-f04601ab",
  "subnet-559dd478"
]

/*
 * Allow DSCI service blocks
 * Allow HUB service blocks
 */
layer_services_cidr_blocks = [
  "10.100.30.0/23",
  "10.100.32.0/23",
  "10.100.34.0/23",
  "10.2.30.0/23",
  "10.2.32.0/23",
  "10.2.34.0/23"
]

layer_data_cidr_blocks = [
  "10.100.40.0/23",
  "10.100.42.0/23",
  "10.100.44.0/23",
  "10.2.40.0/23",
  "10.2.42.0/23",
  "10.2.44.0/23"
]

/*
 * Allow Hub Admin for monitoring
 */
layer_admin_cidr_blocks = [
  "10.100.10.0/23",
  "10.100.12.0/23",
  "10.100.14.0/23",
  "10.2.10.0/23",
  "10.2.12.0/23",
  "10.2.14.0/23",
]
