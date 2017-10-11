# Atlas Hub - Logstash Resources - Variables

variable "asg_capacity" {
  description = <<-EOF
    Number of servers to keep active in the auto-scaling group.
  EOF
}

variable "aws_account_id" {
  description = <<-EOF
    The allowed AWS account ID that this Atlas Project is to run in. (Should always be set to Grindr 2.0 for this project).
  EOF
}

variable "aws_ami" {
  description = <<-EOF
    The latest atlas-trusty-stable AMI in us-east-1.
  EOF
}

variable "ebs_root_volume_size" {
  type = "string"

  description = <<-EOF
    Size in gigabytes of the root EBS volume for EC2 instances.
  EOF
}

variable "ebs_root_volume_type" {
  type = "string"

  description = <<-EOF
    Type of the EBS volume to use for the root volume on the EC2 instances.
  EOF
}

variable "ec2_instance_type" {
  description = <<-EOF
    Instance type to use for the masters.
  EOF
}

variable "ec2_key_name" {
  description = <<-EOF
    Instance type to use for the masters.
  EOF
}

variable "hub_name" {
  description = <<-EOF
    The long hub name of the Atlas hub1 Environment (hub).
  EOF
}

variable "hub_cidr_block" {
  description = <<-EOF
    The CIDR block of the Atlas hub1 Hub.
  EOF
}

variable "lahq_cidr_block" {
  description = <<-EOF
    The CIDR block of the Los Angeles HeadQuarters.
  EOF
}

variable "layer_admin_cidr_blocks" {
  type = "list"

  description = <<-EOF
    A list of three CIDR blocks for the admin subnets in the Atlas hub environment.
  EOF
}

variable "layer_services_cidr_blocks" {
  type = "list"

  description = <<-EOF
    A list of the three services CIDR blocks.
  EOF
}

variable "layer_services_subnet_ids" {
  type = "list"

  description = <<-EOF
    A list of the three subnet ids in services to launch the ELB in.
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
