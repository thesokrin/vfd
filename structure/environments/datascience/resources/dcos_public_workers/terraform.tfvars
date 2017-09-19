asg_capacity = 0
ec2_instance_type = "m4.4xlarge"

# pinned to 3.0 account
aws_account_id = "058144102190"

aws_region = "us-east-1"

cidr_block = "10.100.0.0/16"

coreos_ami_id = "ami-4d795c5a"

dcos_bootstrap_id = "e73ba2b1cd17795e4dcb3d6647d11a29b9c35084"

dynamic_port_end = 10100

dynamic_port_start = 10000

ebs_root_volume_size = 32

ebs_root_volume_type = "gp2"

ebs_var_lib_volume_size = 100

ebs_var_lib_volume_type = "gp2"

ec2_key_name = "isre-shared"

env_name = "datascience"

env_name_fancy = "Atlas Data-Science Environment"

env_name_short = "dsci"

hub_cidr_block = "10.10.0.0/16"

lahq_cidr_block = "10.40.0.0/21"

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

layer_public_subnet_ids = [
  "subnet-1087e459",
  "subnet-7c932727",
  "subnet-c316a6ee",
]

layer_services_cidr_blocks = [
  "10.100.30.0/23",
  "10.100.32.0/23",
  "10.100.34.0/23",
]

project_name_fancy = "DC/OS Public Workers"

private_zone_id = "Z1T8M215NT314"

public_zone_id = "ZOTV85W1CYOWB"

s3_repo_bucket_name = "repo.dsci.grindr.io"

vpc_id = "vpc-36798d50"

web_elb_id = "atlas-dsci-web"

zone = "dsci.grindr.io"
