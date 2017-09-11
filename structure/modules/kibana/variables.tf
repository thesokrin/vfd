# Atlas Kibana Resources - Variables

variable "aws_region" {
  description = <<-EOF
    The AWS Region where these resources will be provisioned.
  EOF
}

variable "env_name" {
  description = <<-EOF
    The long name of the Atlas Environment.
  EOF
}

variable "name" {
  description = <<-EOF
    Name that will used to derive our hostnames.
  EOF
}

variable "project_name" {
  description = <<-EOF
    Name of the project.
  EOF
}

variable "project_owner" {
  default = "isre"

  description = <<-EOF
    Name of responsible party.
  EOF
}

variable "ec2_instance_count" {
  default = 1

  description = <<-EOF
    Number of servers to provision for this module.
  EOF
}

variable "ec2_instance_type" {
  default = "t2.large"

  description = <<-EOF
    Instance type to use for the masters.
  EOF
}

variable "aws_ami" {
  # atlas-trusty-stable-2017-03-07T18-45-01Z
  default = "ami-9c9d3b8a"

  description = <<-EOF
    The latest atlas-trusty stable AMI in us-east-1.
  EOF
}

variable "ebs_root_volume_size" {
  default = 32

  description = <<-EOF
    Size in gigabytes of the root EBS volume for EC2 instances.
  EOF
}

variable "ebs_root_volume_type" {
  default = "gp2"

  description = <<-EOF
    Type of the EBS volume to use for the root volume on the EC2 instances.
  EOF
}

variable "ec2_key_name" {
  default = "isre-shared"

  description = <<-EOF
    Instance type to use for the masters.
  EOF
}

variable "role_package" {
  default = "grindr-role-kibana"

  description = <<-EOF
    The role package to install on all of the kibana servers.
  EOF
}

variable "additional_instance_sg_ids" {
  type = "list"
  default = []

  description = <<-EOF
    A list of additional security groups that should have access to these resources.
  EOF
}

variable "service_port" {
  default = "5601"

  description = <<-EOF
    The service port for Kibana to be configured into the SRV record.
  EOF
}

variable "additional_cidr_blocks" {
  type = "list"
  default = []

  description = <<-EOF
    A list of additional CIDR blocks to grant access to these resources.
  EOF
}
