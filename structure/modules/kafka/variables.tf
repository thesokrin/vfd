# Atlas Kafka Module - Variables
variable "aws_region" {
  description = <<-EOF
    The AWS region of the Atlas Development Environment.
  EOF
}

variable "ami_id" {
  default = "ami-9c9d3b8a"
  description = <<-EOF
    The latest atlas-trusty stable AMI in us-east-1.
  EOF
}

variable "additional_kafka_cidr_blocks" {
  type = "list"
  default = []
  description = <<-EOF
    Allow access to the Kafka port to additional specified CIDR blocks.
  EOF
}

variable "additional_manager_security_group_ids" {
  type = "list"
  default = []
  description = <<-EOF
    Allow access to the Kafka Manager port to additional specified security groups.
  EOF
}

variable "additional_manager_cidr_blocks" {
  type = "list"
  default = ["127.0.0.1"]
  description = <<-EOF
    Allow access to the Kafka Manager port to additional specified CIDR blocks.
  EOF
}

variable "ebs_root_volume_size" {
  default = 32
  description = <<-EOF
    Size in GB of the root EBS volume.
  EOF
}

variable "ebs_root_volume_type" {
  default = "gp2"
  description = <<-EOF
    Type of storage for the root EBS volume.
  EOF
}

variable "ec2_instance_count" {
  default = 3
  description = <<-EOF
    Number of kafka nodes to start.
  EOF
}

variable "ec2_instance_type" {
  default = "r3.2xlarge"
  description = <<-EOF
    EC2 instance type for the kafka instances.
  EOF
}

variable "ec2_keypair_name" {
  default = "isre-shared"
  description = <<-EOF
    EC2 keypair name for the kafka instances.
  EOF
}

variable "env_name" {
  description = <<-EOF
    Long, slugified environment name of the Atlas Environment.
  EOF
}

variable "name" {
  default = "kafka"
  description = <<-EOF
    Name that will used to derive our hostnames.
  EOF
}

variable "project_name" {
  default = "kafka"
  description = <<-EOF
    Name of the project this module or resource is a part of.
  EOF
}

variable "project_owner" {
  default = "isre"
  description = <<-EOF
    The team responsible for billing of these resources.
  EOF
}

variable "role_package" {
  default = "grindr-role-kafka"
  description = <<-EOF
    The role that will be run by ansible.
  EOF
}
