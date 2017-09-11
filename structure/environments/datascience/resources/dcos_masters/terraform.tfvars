# pinned to 3.0 account
aws_account_id = "058144102190"

aws_region = "us-east-1"

cidr_block = "10.100.0.0/16"

coreos_ami_id = "ami-4d795c5a"

dash_elb_id = "atlas-dsci-dash"

dcos_bootstrap_id = "e73ba2b1cd17795e4dcb3d6647d11a29b9c35084"

ebs_root_volume_size = 32

ebs_root_volume_type = "gp2"

ebs_var_lib_volume_size = 100

ebs_var_lib_volume_type = "gp2"

ec2_instance_type = "m4.xlarge"

env_id = "100"

env_name = "datascience"

env_name_fancy = "Atlas Data-Science Environment"

env_name_short = "dsci"

hub_cidr_block = "10.10.0.0/16"

ec2_key_name = "isre-shared"

lahq_cidr_block = "10.40.0.0/21"

layer_admin_cidr_blocks = [
  "10.100.10.0/23",
  "10.100.12.0/23",
  "10.100.14.0/23",
]

layer_admin_subnet_ids = [
  "subnet-1f87e456",
  "subnet-7f932724",
  "subnet-c016a6ed",
]

layer_dmz_cidr_blocks = [
  "10.100.1.0/24",
  "10.100.2.0/24",
  "10.100.3.0/24",
]

layer_public_cidr_blocks = [
  "10.100.20.0/23",
  "10.100.22.0/23",
  "10.100.24.0/23",
]

layer_services_cidr_blocks = [
  "10.100.30.0/23",
  "10.100.32.0/23",
  "10.100.34.0/23",
]

private_zone_id = "Z1T8M215NT314"

reverse_zone_id = "Z380AXUJ5LZJQ5"

vpc_id = "vpc-36798d50"

zone = "dsci.grindr.io"
