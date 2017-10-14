aws_region = "us-east-1"
aws_account_id = "$_ACCOUNT_ID"

name = "$_NAME-$_FANCY_NAME"
env_name = "$_ENVIRONMENT_FANCY"
env_name_short = "$_ENVIRONMENT"
env_name_fancy = "$_ENVIRONMENT_DESCRIPTION"
project_name = "$_ENVIRONMENT-$_NAME"
$_NAME_role_package = "grindr-role-$_NAME"

# EC2 Instance Declarations
$_NAME_instance_count = 1
$_NAME_instance_type = "t2.small"

# CIDR Declarations
additional_$_NAME_cidr_blocks = [
  # hub public layer for $_NAME
]
additional_manager_cidr_blocks = [
  # hub public layer for $_NAME
]
