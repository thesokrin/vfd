# Atlas Development Environment - Development $_FANCY_NAME Load Test Resources - Variables

variable "name" {
  description = <<-EOF
    Name that will used to derive our hostnames.
  EOF
}

variable "env_name" {
  description = <<-EOF
    Long, slugified environment name of the Atlas Development Environment.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    Short, slugified environment name of the Atlas Environment.
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy environment name of the Atlas Enviroment.
  EOF
}

variable "additional_$_NAME_cidr_blocks" {
  type = "list"
  description = <<-EOF
    Allow access to the $_FANCY_NAME port to additional specified CIDR blocks.
  EOF
}

variable "additional_manager_cidr_blocks" {
  type = "list"
  description = <<-EOF
    Allow access to the $_FANCY_NAME Manager port to additional specified CIDR blocks.
  EOF
}

variable "aws_account_id" {
  description = <<-EOF
    AWS account ID of the account resources will live in, should always be the 2.0 account.
  EOF
}

variable "aws_region" {
  description = <<-EOF
    The AWS region of the Atlas Development Environment.
  EOF
}

variable "$_NAME_instance_count" {
  default = 3
  description = <<-EOF
    Number of $_NAME nodes to start.
  EOF
}

variable "$_NAME_instance_type" {
  description = <<-EOF
    EC2 instance type for the $_NAME instances.
  EOF
}

variable "project_name" {
  description = <<-EOF
    Name of the project this module or resource is a part of.
  EOF
}

variable "$_NAME_role_package" {
  description = <<-EOF
    The role package to install for $_FANCY_NAME.
  EOF
}

variable "asg_capacity" {
  default = 3
  description = <<-EOF
    Capcity of the ASG used for load testing
  EOF
}

variable "asg_instance_type" {
  description = <<-EOF
    EC2 instance type for the $_NAME instances.
  EOF
}

variable "asg_cidr_block" {
  description = <<-EOF
    CIDR block of the target Atlas Environment.
  EOF
}

variable "asg_ami_id" {
  default = "ami-9c9d3b8a"

  description = <<-EOF
    AMI ID in the same region as the VPC for Service instances.
  EOF
}

variable "asg_hub_cidr_block" {
  description = <<-EOF
    CIDR block of the Atlas Hub.
  EOF
}

variable "asg_lahq_cidr_block" {
  description = <<-EOF
    The CIDR block for Grindr LA HQ.
  EOF
}

variable "asg_layer_admin_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three CIDR blocks for subnets in the Atlas Admin Layer.
  EOF
}

variable "asg_layer_public_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three CIDR blocks for subnets in the Atlas Public Layer.
  EOF
}

variable "asg_layer_services_subnet_ids" {
  type = "list"

  description = <<-EOF
    List of three subnet ids for subnets in the Atlas Service Layer.
  EOF
}

variable "asg_layer_services_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three subnet ids for subnets in the Atlas Services Layer.
  EOF
}

variable "asg_name" {
  description = <<-EOF
    Name that will used to derive our hostnames.
  EOF
}

variable "asg_private_zone_id" {
  description = <<-EOF
    Hosted zone id for the given Atlas Environment's private hosted zone.
  EOF
}

variable "asg_project_name" {
  description = <<-EOF
    The project name which this module lives in.
  EOF
}

variable "asg_project_name_fancy" {
  default = "Service"

  description = <<-EOF
    The fancy project name which this module lives in.
  EOF
}

variable "asg_project_owner" {
  default = "isre"

  description = <<-EOF
    Team name of the team owning the billing costs for these resources.
  EOF
}

variable "asg_role_package" {
  default = "grindr-role-base"

  description = <<-EOF
    The role that will be launched via cloud init.
  EOF
}

variable "asg_vpc_id" {
  description = <<-EOF
    VPC ID of the given Atlas Environment.
  EOF
}

variable "asg_zone" {
  description = <<-EOF
    The hosted zone name of this Atlas Environment.
  EOF
}

variable "asg_spot_price" {
  default = ""

  description = <<-EOF
    The maximum bid price for new Spot Instances in the ASG. Setting a value enables Spot Instancing.
  EOF
}
