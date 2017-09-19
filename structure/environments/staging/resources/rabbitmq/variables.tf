# Atlas Staging Environment - RabbitMQ Resources - Variables

variable "instance_count" {
  default = 0
  description = <<-EOF
    The number of instances to generate in the environment
  EOF
}

variable "project_name" {
  default = "rabbitmq"
  description = <<-EOF
    Name of the project this module or resource is a part of.
  EOF
}

variable "package_role" {
  default = "grindr-role-rabbitmq"
  description = <<-EOF
    The role that will be launched via cloud init.
  EOF
}

variable "aws_account_id" {
  description = <<-EOF
    AWS account id of the Atlas Staging Environment.
  EOF
}

variable "cidr_block" {
  description = <<-EOF
    CIDR block of the Atlas Staging Environment
  EOF
}

variable "env_name" {
  description = <<-EOF
    Long, slugified environment name of the Atlas Staging Environment (staging).
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy environment name of the Atlas Staging Environment.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    Short, slugified environment name of the Atlas Staging Environment.
  EOF
}

variable "layer_data_subnet_ids" {
  type = "list"
  description = <<-EOF
    A list of three subnet ids in the data layer of the Atlas Staging Environment.
  EOF
}

variable "layer_services_cidr_blocks" {
  type = "list"
  description = <<-EOF
    CIDR block for the Atlas services layer.
  EOF
}

variable "layer_data_cidr_blocks" {
  type = "list"
  description = <<-EOF
    CIDR block for the Atlas data layer.
  EOF
}

variable "layer_admin_cidr_blocks" {
  type = "list"
  description = <<-EOF
    CIDR block for the Atlas admin layer.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    The private zone id for the Atlas Staging Environment.
  EOF
}

variable "reverse_zone_id" {
  description = <<-EOF
    The reverse zone id for the Atlas Staging Environment.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    The VPC ID of the Atlas Staging Environment.
  EOF
}

variable "zone" {
  description = <<-EOF
    The hosted zone name of the Atlas Staging Environment.
  EOF
}
