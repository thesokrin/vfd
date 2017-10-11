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

variable "ec2_capacity" {
  default = 3
  description = <<-EOF
    Capcity of the ASG used for load testing
  EOF
}

variable "ec2_instance_type" {
  description = <<-EOF
    EC2 instance type for the kafka instances.
  EOF
}

variable "ec2_cidr_block" {
  description = <<-EOF
    CIDR block of the target Atlas Environment.
  EOF
}

variable "ec2_ami_id" {
  default = "ami-9c9d3b8a"

  description = <<-EOF
    AMI ID in the same region as the VPC for Service instances.
  EOF
}

variable "ec2_hub_cidr_block" {
  description = <<-EOF
    CIDR block of the Atlas Hub.
  EOF
}

variable "ec2_lahq_cidr_block" {
  description = <<-EOF
    The CIDR block for Grindr LA HQ.
  EOF
}

variable "ec2_layer_admin_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three CIDR blocks for subnets in the Atlas Admin Layer.
  EOF
}

variable "ec2_layer_public_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three CIDR blocks for subnets in the Atlas Public Layer.
  EOF
}

variable "ec2_layer_services_subnet_ids" {
  type = "list"

  description = <<-EOF
    List of three subnet ids for subnets in the Atlas Service Layer.
  EOF
}

variable "ec2_layer_services_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three subnet ids for subnets in the Atlas Services Layer.
  EOF
}

variable "ec2_name" {
  description = <<-EOF
    Name that will used to derive our hostnames.
  EOF
}

variable "ec2_private_zone_id" {
  description = <<-EOF
    Hosted zone id for the given Atlas Environment's private hosted zone.
  EOF
}

variable "ec2_project_name" {
  description = <<-EOF
    The project name which this module lives in.
  EOF
}

variable "ec2_project_name_fancy" {
  default = "Service"

  description = <<-EOF
    The fancy project name which this module lives in.
  EOF
}

variable "ec2_project_owner" {
  default = "isre"

  description = <<-EOF
    Team name of the team owning the billing costs for these resources.
  EOF
}

variable "ec2_role_package" {
  default = "grindr-role-base"

  description = <<-EOF
    The role that will be launched via cloud init.
  EOF
}

variable "ec2_vpc_id" {
  description = <<-EOF
    VPC ID of the given Atlas Environment.
  EOF
}

variable "ec2_zone" {
  description = <<-EOF
    The hosted zone name of this Atlas Environment.
  EOF
}

variable "ec2_spot_price" {
  default = ""

  description = <<-EOF
    The maximum bid price for new Spot Instances in the ASG. Setting a value enables Spot Instancing.
  EOF
}
