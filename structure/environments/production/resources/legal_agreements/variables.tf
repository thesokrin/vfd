# Atlas Production Environment - Legal Agreements Resources - Variables

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

variable "public_zone_id" {
  description = <<-EOF
    The public zone id of the Atlas Production Environment.
  EOF
}

variable "wildcard_certificate_arn" {
  description = <<-EOF
    The wildcard certificate ARN for the Atlas Production Environment.
  EOF
}

variable "zone" {
  description = <<-EOF
    The hosted zone name of the Atlas Production Environment.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    Short environment name.
  EOF
}
