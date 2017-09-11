aws_account_id = "886703752586"

aws_region = "us-east-1"

ec2_instance_type = "c4.2xlarge"

env_cidr_block = "10.51.0.0/16"

env_name = "staging"

env_name_fancy = "Atlas Staging Environment"

env_name_short = "stg"

hub_cidr_block = "10.10.0.0/16"

lahq_cidr_block = "10.40.0.0/21"

layer_dmz_cidr_blocks = [
  "10.51.1.0/24",
  "10.51.2.0/24",
  "10.51.3.0/24",
]

layer_dmz_subnet_ids = [
  "subnet-c307478a",
  "subnet-44bb301f",
  "subnet-18c45535",
]

layer_public_cidr_blocks = [
  "10.51.20.0/23",
  "10.51.22.0/23",
  "10.51.24.0/23",
]

layer_services_cidr_blocks = [
  "10.51.30.0/23",
  "10.51.32.0/23",
  "10.51.34.0/23",
]

layer_services_subnet_ids = [
  "subnet-c207478b",
  "subnet-79bb3022",
  "subnet-17c4553a",
]

presence_auth_host = "loadtest-api.preprod1.grindr.com"

private_zone_id = "Z1LQ8GB9CX2UQF"

public_zone_id = "Z2HTQVO8VCSEGD"

reverse_zone_id = "Z2HOUF98NNMQP3"

vpc_id = "vpc-054e9f63"

wildcard_certificate_arn = "arn:aws:acm:us-east-1:886703752586:certificate/820d82b6-fdd7-4dcf-b53d-4db68efefa31"

zone = "stg.grindr.io"
