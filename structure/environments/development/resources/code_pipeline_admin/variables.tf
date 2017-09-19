# Atlas Development Environment - Code Pipeline Admin - Variables

variable "aws_account_id" {
  description = <<-EOF
    The AWS account id of the Atlas Development Environment.
  EOF
}

variable "aws_region" {
  description = <<-EOF
    The AWS region of the Atlas Development Environment.
  EOF
}

variable "env_name" {
  description = <<-EOF
    The long name of the Atlas Development Environment.
  EOF
}

variable "zone" {
  description = <<-EOF
    The zone name of the given Atlas Environment.
  EOF
}
