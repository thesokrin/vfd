# Codis Proxy Module - Variables

variable "atlas_environment" {
  description = <<-EOF
    The Atlas Environment or Hub in which to launch these resources. Long environment names are required.
  EOF
}

variable "additional_cidr_blocks" {
  type    = "list"
  default = []
  description = <<-EOF
    Additional CIDR blocks to allow access to Codis from.
  EOF
}

variable "aws_region" {
  default = "us-east-1"
  description = <<-EOF
    The AWS region in which the given Atlas Environment lives.
  EOF
}

variable "ebs_root_volume_size" {
  default = 32
  description = <<-EOF
    The size in gigabytes of the root volume for Codis instances.
  EOF
}

variable "ebs_root_volume_type" {
  default = "gp2"
  description = <<-EOF
    The type of storage to use for the root filesystem for Codis instances.
  EOF
}

variable "ec2_keypair_name" {
  default = "isre-shared"
  description = <<-EOF
    Name of the EC2 keypair to use for the default user.
  EOF
}

variable "ami_id" {
  default = "ami-9c9d3b8a"
  description = <<-EOF
    AMI id in same region to run instances on.
  EOF
}

variable "instance_count" {
  default = 3
  description = <<-EOF
    Number of instances to create across subnets in the Atlas Data Layer for the given Atlas Environment or Hub.
  EOF
}

variable "instance_type" {
  default = "r4.xlarge"
  description = <<-EOF
    The instance size to use for nodes.
  EOF
}

variable "name" {
  default = "codis"
  description = <<-EOF
    The name of the resources to create. Will be used in DNS record names etc.
  EOF
}

variable "project_name" {
  default = "codis_proxy"
  description = <<-EOF
    Name of the Atlas Project hosting these resources.
  EOF
}

variable "project_owner" {
  default = "isre"
  description = <<-EOF
    Team responsible for billing of these resources.
  EOF
}

variable "redis_upstream" {
  default = "redis"
  description = <<-EOF
    The upstream Redis Cluster DNS name to proxy to.
  EOF
}

variable "role_name" {
  default = "atlas_ec2_assume_role"
  description = <<-EOF
    Name of an IAM Role to associate with the instance profiles.
  EOF
}

variable "role_package" {
  default = "grindr-role-base"
  description = <<-EOF
    The role package to install on the systems.
  EOF
}
