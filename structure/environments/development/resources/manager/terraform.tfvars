# pinned to preprod account
aws_account_id = "202004573189"

layer_dmz_cidr_blocks = [
  "10.50.1.0/24",
  "10.50.2.0/24",
  "10.50.3.0/24"
]

layer_dmz_subnet_ids = [
  "subnet-00593949",
  "subnet-68b00533",
  "subnet-be4bfa93"
]

env_name = "development"
env_name_fancy = "Atlas Development Environment"
env_name_short = "dev"

public_zone_id = "Z8XZ5736MQ6A4"
private_zone_id = "ZH2Y70RD294AJ"
reverse_zone_id = "Z2KY29K93KM131"

vpc_id = "vpc-d3de2bb5"

zone = "dev.grindr.io"
