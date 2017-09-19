availability_zones = [
  "us-east-1a",
  "us-east-1b",
  "us-east-1d"
]

coreos_ami_id = "ami-4d795c5a"

dash_elb_id = "atlas-dev-dash"

dcos_bootstrap_id = "e73ba2b1cd17795e4dcb3d6647d11a29b9c35084"

ebs_root_volume_size = 32
ebs_root_volume_type = "gp2"

ebs_var_lib_volume_size = 100
ebs_var_lib_volume_type = "gp2"

ec2_instance_type = "m4.xlarge"

env_cidr_block = "10.50.0.0/16"
env_id = "50"
env_name = "development"
env_name_short = "dev"

hub_cidr_block = "10.10.0.0/16"

key_name = "isre-shared"

lahq_cidr_block = "10.40.0.0/21"

layer_admin_cidr_blocks = [
  "10.50.10.0/23",
  "10.50.12.0/23",
  "10.50.14.0/23"
]

layer_admin_subnet_ids = [
  "subnet-19593950",
  "subnet-66b0053d",
  "subnet-b04bfa9d"
]

layer_dmz_cidr_blocks = [
  "10.50.1.0/24",
  "10.50.2.0/24",
  "10.50.3.0/24"
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

private_zone_id = "ZH2Y70RD294AJ"
reverse_zone_id = "Z2KY29K93KM131"

vpc_id = "vpc-d3de2bb5"

zone = "dev.grindr.io"
