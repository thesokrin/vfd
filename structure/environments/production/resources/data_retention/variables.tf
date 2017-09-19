# Atlas Production Environment - Data Retention Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    The AWS account id of the Atlas Production Environment.
  EOF
}

variable "aws_region" {
  description = <<-EOF
    The AWS region of the Atlas Production Environment.
  EOF
}

variable "env_name" {
  description = <<-EOF
    The long name of the Atlas Production Environment.
  EOF
}

variable "zone" {
  description = <<-EOF
    The hosted zone name of the Atlas Production Environment.
  EOF
}

variable "name" {
  description = <<-EOF
    The general name prefix to use for resources.
  EOF
}

variable "project_name" {
  description = <<-EOF
    The Atlas Project name for these resources.
  EOF
}

variable "project_owner" {
  description = <<-EOF
    The team responsible for the billing of these resources.
  EOF
}

variable "ec2_instance_type" {
  description = <<-EOF
    The EC2 instance type to launch.
  EOF
}
