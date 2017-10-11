# Atlas Development Environment - Development Kafka Load Test Resources - Variables

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

variable "kafka_instance_count" {
  default = 3
  description = <<-EOF
    Number of kafka nodes to start.
  EOF
}

variable "kafka_instance_type" {
  description = <<-EOF
    EC2 instance type for the kafka instances.
  EOF
}

variable "project_name" {
  description = <<-EOF
    Name of the project this module or resource is a part of.
  EOF
}

variable "kafka_role_package" {
  description = <<-EOF
    The role package to install for Kafka.
  EOF
}
