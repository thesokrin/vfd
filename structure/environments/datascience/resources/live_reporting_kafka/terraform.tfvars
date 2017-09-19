aws_region = "us-east-1"
aws_account_id = "058144102190"

name = "live-reporting-kafka-kafka"
env_name = "datascience"
project_name = "live-reporting-kafka"
kafka_role_package = "grindr-role-kafka"

kafka_instance_count = 6
kafka_instance_type = "d2.2xlarge"

additional_kafka_cidr_blocks = [
  # hub public layer for artemis
]

additional_manager_cidr_blocks = [
  # hub public layer for artemis
]

env_name_short = "dsci"
env_name_fancy = "Atlas Data-Science Environment"
