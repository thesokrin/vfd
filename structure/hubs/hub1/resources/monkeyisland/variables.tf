# Atlas Hub - MonkeyIsland Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    AWS account id of the Atlas Hub.
  EOF
}

variable "aws_region" {
  description = <<-EOF
    AWS region of the Atlas Production Environment.
  EOF
}

variable "env_name" {
  description = <<-EOF
    Long, slugified environment name of the Atlas Hub (hub).
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy environment name of the Atlas Hub.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    Short, slugified environment name of the Atlas Hub.
  EOF
}

variable "ec2_instance_count" {
  default = "3"

  description = <<-EOF
    Number of EC2 instances for static_service cluster.
  EOF
}

variable "cidr_block" {
  description = <<-EOF
    CIDR block for the Atlas Stack in which this module is deployed.
  EOF
}

variable "layer_admin_cidr_blocks" {
  type = "list"

  description = <<-EOF
    A list of three CIDR blocks for the admin subnets in the Atlas Dev environment.
  EOF
}

variable "layer_services_cidr_blocks" {
  type = "list"

  description = <<-EOF
    A list of three CIDR blocks for the services subnets in the Atlas Dev environment.
  EOF
}

variable "layer_services_subnet_ids" {
  type = "list"
  description = <<-EOF
    A list of the three subnet ids in services to launch the ELB in.
  EOF
}


variable "layer_public_cidr_blocks" {
  type = "list"
  description = <<-EOF
    A list of the three public CIDR blocks.
  EOF
}

variable "lahq_cidr_block" {
  description = <<-EOF
    CIDR block for the LA office.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    VPC ID of the Atlas hub1 Environment.
  EOF
}
