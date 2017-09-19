# Atlas Production - Recommendation Resources - Variables
variable "aws_region" {
  description = <<-EOF
    The AWS region of the Atlas Development Environment.
  EOF
}

variable "atlas_environment" {
  description = <<-EOF
    The full Atlas Environment name for the Atlas Production (prod-3.0).
  EOF
}

variable "aws_account_id" {
  description = <<-EOF
    The AWS account id of the Atlas Production.
  EOF
}

variable "ec2_instance_type" {
  description = <<-EOF
    The EC2 instance type to launch.
  EOF
}

variable "project_name" {
  description = <<-EOF
    Atlas Project name.
  EOF
}

variable "project_owner" {
  description = <<-EOF
    Team responsible for billing of these resources.
  EOF
}

variable "vpc" {
  description = <<-EOF
    VPC ID where this will go.
  EOF
}

variable "subnet" {
  description = <<-EOF
    Subnet to use.
  EOF
}

variable "cidr" {
  type        = "list"
  description = <<-EOF
    CIDR to allow in SG.
  EOF
}
