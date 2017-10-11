asg_capacity = 6

# grindr 2.0 account
aws_account_id = "284224159432"

ec2_instance_type = "i2.2xlarge"
ec2_keypair_name = "isre-shared"

ebs_root_volume_type = "gp2"
ebs_root_volume_size = 32

elasticsearch_cluster_id = "mJvKz2kBPhahnwku1Px4Eqsff7fhnvPJ"

hub_cidr_block = "10.10.0.0/16"
hub_name = "hub"

lahq_cidr_block = "10.40.0.0/21"

layer_admin_cidr_blocks = [
  "10.10.10.0/23",
  "10.10.12.0/23",
  "10.10.14.0/23"
]

layer_data_cidr_blocks = [
  "10.10.40.0/23",
  "10.10.42.0/23",
  "10.10.44.0/23"
]

layer_data_subnet_ids = [
  "subnet-b3f394fa",
  "subnet-755ff72e",
  "subnet-4839e874"
]

layer_services_cidr_blocks = [
  "10.10.30.0/23",
  "10.10.32.0/23",
  "10.10.34.0/23"
]

private_zone_id = "Z1RCUXX7W0A26O"

# atlas-trusty-stable-2017-03-07T18-45-01Z
ami_id = "ami-9c9d3b8a"

vpc_id = "vpc-62e70f04"

zone = "hub.grindr.io"
