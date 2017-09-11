env_name = "development"

layer_admin_cidr_blocks = [
  "10.50.10.0/23",
  "10.50.12.0/23",
  "10.50.14.0/23"
]

layer_public_cidr_blocks = [
  "10.50.20.0/23",
  "10.50.22.0/23",
  "10.50.24.0/23"
]

layer_services_cidr_blocks = [
  "10.50.30.0/23",
  "10.50.32.0/23",
  "10.50.34.0/23"
]

layer_services_subnet_ids = [
  "subnet-1559395c",
  "subnet-1ab00541",
  "subnet-8c4bfaa1"
]

private_zone_id = "ZH2Y70RD294AJ"

vpc_id = "vpc-d3de2bb5"

wildcard_certificate_arn = "arn:aws:acm:us-east-1:202004573189:certificate/1f39026c-d526-4c71-abc3-adb1833e0636"

zone = "dev.grindr.io"
