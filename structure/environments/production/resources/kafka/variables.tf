# Atlas Data-Science Environment - Kafka Resources - Variables

variable "name" {
  description = <<-EOF
    Name that will used to derive our hostnames.
  EOF
}

variable "additional_kafka_cidr_blocks" {
  type = "list"
  description = <<-EOF
    Allow access to the Kafka port to additional specified CIDR blocks.
  EOF
}

variable "additional_manager_cidr_blocks" {
  type = "list"
  description = <<-EOF
    Allow access to the Kafka Manager port to additional specified CIDR blocks.
  EOF
}

variable "artemis_sg_id" {
  description = <<-EOF
    Security group id of Artemis instances in the Atlas Production Environment to allow them access to Exhibitor.
  EOF
}

variable "aws_account_id" {
  description = <<-EOF
    AWS account ID of the account resources will live in, should always be the 2.0 account.
  EOF
}

variable "aws_region" {
  description = <<-EOF
    The AWS region of the Atlas Data-Science Environment.
  EOF
}

variable "ec2_instance_count" {
  default = 3
  description = <<-EOF
    Number of kafka nodes to start.
  EOF
}

variable "ec2_instance_type" {
  description = <<-EOF
    EC2 instance type for the kafka instances.
  EOF
}

variable "cidr_block" {
  description = <<-EOF
    CIDR block of the Atlas Data-Science Environment
  EOF
}

variable "project_name" {
  description = <<-EOF
    Name of the project this module or resource is a part of.
  EOF
}

variable "env_name" {
  description = <<-EOF
    Long, slugified environment name of the Atlas Data-Science Environment (Data-Science).
  EOF
}
variable "env_name_fancy" {
  description = <<-EOF
    Long, slugified environment name of the Atlas Data-Science Environment (Data-Science).
  EOF
}
variable "env_name_short" {
  description = <<-EOF
    Long, slugified environment name of the Atlas Data-Science Environment (Data-Science).
  EOF
}

variable "layer_admin_cidr_blocks" {
  type = "list"
  description = <<-EOF
    A list of the three CIDR blocks for the Atlas Admin Layer.
  EOF
}

variable "layer_data_cidr_blocks" {
  type = "list"
  description = <<-EOF
    A list of the three CIDR blocks for the Atlas Data Layer.
  EOF
}

variable "layer_data_subnet_ids" {
  type = "list"
  description = <<-EOF
    A list of the three subnet ids for the Atlas Data Layer.
  EOF
}

variable "layer_services_cidr_blocks" {
  type = "list"
  description = <<-EOF
    A list of the three CIDR blocks for the Atlas Services Layer.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    The private zone id of the internal DNS hosted zone.
  EOF
}

variable "reverse_zone_id" {
  description = <<-EOF
    The reverse zone id for the Atlas Data-Science Environment.
  EOF
}

variable "role_package" {
  description = <<-EOF
    The role package to install for Kafka.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    The VPC id of the Atlas Data-Science Environment.
  EOF
}

variable "zone" {
  description = <<-EOF
    The hosted zone name of the Atlas Data-Science Environment.
  EOF
}
