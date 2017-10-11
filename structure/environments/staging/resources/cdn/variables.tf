# Atlas Staging Environment - CDN Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    The AWS account id of the Atlas Staging Environment.
  EOF
}

variable "aws_region" {
  description = <<-EOF
    The AWS region of the Atlas Staging Environment.
  EOF
}

variable "env_name" {
  description = <<-EOF
    The long name of the Atlas Staging Environment.
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    The fancy name of the Atlas Staging Environment.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    The short, slugified name of the Atlas Staging Environment.
  EOF
}

variable "public_zone_id" {
  description = <<-EOF
    The public zone id of the Atlas Staging Environment.
  EOF
}

variable "wildcard_certificate_arn" {
  description = <<-EOF
    The ARN for the wildcard certificate for the Atlas Staging Environment.
  EOF
}

variable "zone" {
  description = <<-EOF
    The hosted zone name of the Atlas Staging Environment.
  EOF
}
