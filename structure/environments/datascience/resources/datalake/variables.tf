# Atlas Data-Science Environment - Datalake Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    AWS account id of the Atlas Data-Science Environment.
  EOF
}

variable "aws_region" {
  description = <<-EOF
  	The AWS region of the Atlas Data-Science Environment.
	EOF
}

variable "name" {
  description = <<-EOF
    The name of this project.
  EOF
}

variable "env_name" {
  description = <<-EOF
    Long, slugified environment name of the Atlas Data-Science Environment (datascience).
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy environment name of the Atlas Data-Science Environment.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    Short, slugified environment name of the Atlas Data-Science Environment.
  EOF
}

variable "project_owner" {
  description = <<-EOF
    The team responsible for the billing of these resources.
  EOF
}

variable "zone" {
  description = <<-EOF
    The zone name of the given Atlas Environment.
  EOF
}
