# Atlas Development Environment - Auth Captcha Resources - Variables

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

variable "env_name_short" {
  description = <<-EOF
    Short environment name.
  EOF
}

variable "public_zone_id" {
  description = <<-EOF
    The public zone id of the Atlas Development Environment.
  EOF
}

variable "wildcard_certificate_arn" {
  description = <<-EOF
    The wildcard certificate ARN for the Atlas Development Environment.
  EOF
}

variable "zone" {
  description = <<-EOF
    The hosted zone name of the Atlas Development Environment.
  EOF
}
