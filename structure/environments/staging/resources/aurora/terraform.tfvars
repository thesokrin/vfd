# Atlas Staging Environment - Aurora Cluster Resources - State Variables

atlas_owner = "isre"

atlas_project = "aurora"

aws_account_id = "886703752586"

aws_region = "us-east-1"

env_name = "staging"

env_name_fancy = "Atlas Staging Environment"

env_name_short = "stg"

layer_admin_cidr_blocks = [
  "10.51.10.0/23",
  "10.51.12.0/23",
  "10.51.14.0/23",
]

layer_data_cidr_blocks = [
  "10.51.40.0/23",
  "10.51.42.0/23",
  "10.51.44.0/23",
]

layer_data_subnet_ids = [
  "subnet-c1074788",
  "subnet-46bb301d",
  "subnet-1ec45533",
]

layer_services_cidr_blocks = [
  "10.51.30.0/23",
  "10.51.32.0/23",
  "10.51.34.0/23",
]

private_zone_id = "Z1LQ8GB9CX2UQF"

vpc_id = "vpc-054e9f63"

zone = "stg.grindr.io"

# Aurora main
main_cluster_id = "aurora"
main_backup_retention_period = 1
main_password = "jKtyUwBurnHkABsf7hbB"
main_skip_final_snapshot = true
