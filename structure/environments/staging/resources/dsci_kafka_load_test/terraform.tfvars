aws_region = "us-east-1"
aws_account_id = "886703752586"

name = "dsci-kafka-kafka"
env_name = "staging"
project_name = "dsci-kafka-kafka"
kafka_role_package = "grindr-role-kafka"

kafka_instance_count = 3
kafka_instance_type = "d2.2xlarge"

additional_kafka_cidr_blocks = [
  # hub public layer for artemis
]

additional_manager_cidr_blocks = [
  # hub public layer for artemis
]

env_name_short = "stg"
env_name_fancy = "Atlas Staging Environment"

ec2_cidr_block = "10.51.0.0/16"
ec2_capacity = 6
ec2_instance_type = "c4.2xlarge"
ec2_hub_cidr_block = "10.10.0.0/16"
ec2_lahq_cidr_block = "10.40.0.0/21"
ec2_layer_admin_cidr_blocks = [
  "10.51.10.0/23",
  "10.51.12.0/23",
  "10.51.14.0/23"
]
ec2_layer_public_cidr_blocks = [
  "10.51.20.0/23",
  "10.51.22.0/23",
  "10.51.24.0/23"
]
ec2_layer_services_cidr_blocks = [
  "10.51.30.0/23",
  "10.51.32.0/23",
  "10.51.34.0/23"
]
ec2_layer_services_subnet_ids = [
  "subnet-c207478b",
  "subnet-79bb3022",
  "subnet-17c4553a"
]
ec2_name = "dsci-kafka-generators"
ec2_project_name = "dsci-kafka-load-test"
ec2_project_name_fancy = "Data-Science Kafka Load Testing"
ec2_project_owner = "dsci"
ec2_private_zone_id = "Z1LQ8GB9CX2UQF"
ec2_role_package = "grindr-role-base"
ec2_vpc_id = "vpc-054e9f63"
ec2_zone = "stg.grindr.io"
ec2_spot_price = "0.4"
