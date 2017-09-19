# Atlas Production Environment - Atlas Variables

variable "aws_account_id" {
  description = <<-EOF
    AWS Account ID to launch the environment in.

    This should always be 3.0 for production.
  EOF
}

variable "env_id" {
  description = <<-EOF
    The ID and second octet of the environment.
  EOF
}

variable "env_name" {
  description = <<-EOF
    The long environment name for this environment.
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy environment name for the Atlas Production Environment.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    The short environment name for this environment.
  EOF
}

variable "hub_account_id" {
  description = <<-EOF
    The account in which the Atlas Hub exists. Used for VPC peering.
  EOF
}

variable "hub_cidr_block" {
  description = <<-EOF
    The CIDR block which the Atlas Hub occupies.
  EOF
}

variable "hub_vpc_id" {
  description = <<-EOF
    The VPC id of the Atlas Hub.
  EOF
}

variable "hub_zone" {
  description = <<-EOF
    The hosted zone name of the Atlas Hub.
  EOF
}

variable "wildcard_certificate_arn" {
  description = <<-EOF
    ARN for the wildcard certificate for the Atlas Production Environment.
  EOF
}
