# Atlas Hub 1 - Redis Resources - Variables

variable "availability_zones" {
  type = "list"

  description = <<-EOF
    A list of the three availability zones where this environment lives.
  EOF
}

variable "aws_ami" {
  description = <<-EOF
    Amazon machine ID for Ubuntu 14.04 version we have tested on.
  EOF
}

variable "aws_account_id" {
  description = <<-EOF
    The allowed AWS account ID that this Atlas Project is to run in. (Should always be the Grindr 2.0 account).
  EOF
}

variable "aws_region" {
  description = <<-EOF
    The region this project runs in.
  EOF
}

variable "ec2_instance_type" {
  description = <<-EOF
    Instance type to use for the Redis instances.
  EOF
}

variable "hub_cidr_block" {
  description = <<-EOF
    The hub cidr block
  EOF
}

variable "hub_id" {
  description = <<-EOF
    The hub identificaiton number.
  EOF
}

variable "hub_name" {
  description = <<-EOF
    The long environment name of the Atlas hub1 Environment (hub).
  EOF
}

variable "hub_name_short" {
  description = <<-EOF
    The short name for hub.
  EOF
}

variable "key_name" {
  type = "string"

  description = <<-EOF
    EC2 SSH Key Name
  EOF
}

variable "lahq_cidr_block" {
  description = <<-EOF
    CIDR block for the LA office.
  EOF
}

variable "layer_admin_cidr_blocks" {
  type = "list"

  description = <<-EOF
    A list of three CIDR blocks for the admin subnets in the Atlas Dev environment.
  EOF
}

variable "layer_data_cidr_blocks" {
  type = "list"

  description = <<-EOF
    A list of three CIDR blocks for the admin subnets in the Atlas Dev environment.
  EOF
}

variable "layer_data_subnet_ids" {
  type = "list"

  description = <<-EOF
    A list of three subnet ids for subnets in the services Atlas Layer in the Atlas Development Environment.
  EOF
}

variable "layer_services_cidr_blocks" {
  type = "list"

  description = <<-EOF
    A list of three CIDR blocks for the services subnets in the Atlas Dev environment.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    Private hosted zone id of the Atlas hub1 Environment.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    VPC ID of the Atlas hub1 Environment.
  EOF
}

variable "zone" {
  description = <<-EOF
    The hosted zone name for the Atlas hub1 Environment.
  EOF
}
