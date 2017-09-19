asg_capacity = 3

coreos_ami_id = "ami-4d795c5a"

dcos_bootstrap_id = "e73ba2b1cd17795e4dcb3d6647d11a29b9c35084"

dynamic_port_start = 10000
dynamic_port_end = 10100

ec2_instance_type = "m4.4xlarge"

ebs_root_volume_size = 32
ebs_root_volume_type = "gp2"

ebs_var_lib_volume_size = 100
ebs_var_lib_volume_type = "gp2"

env_cidr_block = "10.50.0.0/16"
env_name = "development"
env_name_short = "dev"

hub_cidr_block = "10.10.0.0/16"

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

lahq_cidr_block = "10.40.0.0/21"

mesos_worker_role = "atlas_dev_mesos_worker_role"

private_zone_id = "ZH2Y70RD294AJ"

registry_elb_id = "atlas-dev-docker-registry"

vpc_id = "vpc-d3de2bb5"

zone = "dev.grindr.io"
