aws_region = "us-east-1"
aws_account_id = "886703752586"

name = "jenkinsmaster-Jenkins Master"
env_name = "hub_FANCY"
env_name_short = "hub"
env_name_fancy = "hub_DESCRIPTION"
project_name = "hub-jenkinsmaster"
jenkinsmaster_role_package = "grindr-role-jenkinsmaster"

# EC2 Instance Declarations
jenkinsmaster_instance_count = 1
jenkinsmaster_instance_type = "t2.small"

# CIDR Declarations
additional_jenkinsmaster_cidr_blocks = [
  # hub public layer for artemis
]
additional_manager_cidr_blocks = [
  # hub public layer for artemis
]

# Autoscaling Group Declarations
#asg_cidr_block = "10.51.0.0/16"
#asg_capacity = 6
#asg_instance_type = "c4.2xlarge"
#asg_hub_cidr_block = "10.10.0.0/16"
#asg_lahq_cidr_block = "10.40.0.0/21"
#asg_layer_admin_cidr_blocks = [
#  "10.51.10.0/23",
#  "10.51.12.0/23",
#  "10.51.14.0/23"
#]
#asg_layer_public_cidr_blocks = [
#  "10.51.20.0/23",
#  "10.51.22.0/23",
#  "10.51.24.0/23"
#]
#asg_layer_services_cidr_blocks = [
#  "10.51.30.0/23",
#  "10.51.32.0/23",
#  "10.51.34.0/23"
#]
#asg_layer_services_subnet_ids = [
#  "subnet-c207478b",
#  "subnet-79bb3022",
#  "subnet-17c4553a"
#]
#asg_name = "dsci-jenkinsmaster-generators"
#asg_project_name = "jenkinsmaster"
#asg_project_name_fancy = "Jenkins Master"
#asg_project_owner = "ISRE Team"
#asg_private_zone_id = "$_ASG_PRIVATE_ZONE_ID"
#asg_role_package = "grindr-role-base"
#asg_vpc_id = "$_ASG_VPC_ID"
#asg_zone = "hub.grindr.io"
#asg_spot_price = "0.4"
