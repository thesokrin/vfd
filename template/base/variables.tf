# Atlas $_ENVIRONMENT - $_FANCY_NAME - Variables
variable "aws_region" {
  description = <<-EOF
    The AWS region of the Atlas Development Environment.
  EOF
}

variable "atlas_environment" {
  description = <<-EOF
    The full Atlas Environment name for the Atlas $_ENVIRONMENT ($_ACCOUNT_NAME).
  EOF
}

variable "ec2_iam_role" {
  default = ""

  description = <<-EOF
    An IAM role object to attach to the IAM instance profile of the static_service host.
  EOF
}

variable "module" {
  default = "atlas_static_module"

  description = <<-EOF
    Static Module for Atlas Resources
  EOF
}

variable "aws_account_id" {
  description = <<-EOF
    The AWS account id of the Atlas $_ENVIRONMENT.
  EOF
}

variable "ec2_instance_type" {
 description = <<-EOF
   The EC2 instance type to launch.
 EOF
}

variable "ec2_instance_count" {
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
    Team responsible for billing of these $_TYPE.
  EOF
}
