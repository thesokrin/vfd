# Atlas Data-Science Environment - Redshift Cluster Resources - State Variables

availability_zones = [
  "us-east-1a",
  "us-east-1b",
  "us-east-1d",
]

# pinned to 3.0 account
aws_account_id = "058144102190"

aws_region = "us-east-1"

cidr_block = "10.100.0.0/16"

env_name = "datascience"

env_name_fancy = "Atlas Data-Science Environment"

env_name_short = "dsci"

lahq_cidr_block = "10.40.0.0/21"

layer_admin_cidr_blocks = [
  "10.100.10.0/23",
  "10.100.12.0/23",
  "10.100.14.0/23",
]

layer_data_cidr_blocks = [
  "10.100.40.0/23",
  "10.100.42.0/23",
  "10.100.44.0/23",
]

layer_services_cidr_blocks = [
  "10.100.30.0/23",
  "10.100.32.0/23",
  "10.100.34.0/23",
]

layer_data_subnet_ids = [
  "subnet-2d87e464",
  "subnet-68932733",
  "subnet-df16a6f2",
]

atlas_manager_ip = "10.100.1.10/32"

redshift_cluster_id = "atlas-dsci-redshift"

redshift_cluster_type = "multi-node"

redshift_database = "datascience"

redshift_database_port = "5439"

# ddd:hh24:mi-ddd:hh24:mi
redshift_maintenance_window = "sat:21:00-sun:20:00"

redshift_node_count = "2"

# dc1.large, dc1.8large, ds2.xlarge, ds2.8xlarge, ds1.xlarge, ds1.8xlarge
redshift_node_type = "ds2.xlarge"

redshift_password = "znjAQc97OpJyy7DUx8ibpLBSBo5zZyW8"

redshift_snapshot_retention_period = "7"

redshift_username = "isre_admin"

vpc_id = "vpc-36798d50"

zone = "dsci.grindr.io"
