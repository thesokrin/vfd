# Atlas Development Environment - Atlas Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    The AWS account ID that this environment belongs to (preprod).
  EOF
}

variable "env_id" {
  description = <<-EOF
    The ID and second octet of this Atlas Environment.
  EOF
}

variable "env_name" {
  description = <<-EOF
    The long environment name for this Atlas Environment.
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy environment name for this Atlas Environment.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    The short environment name for this Atlas Environment.
  EOF
}

variable "hub_account_id" {
  description = <<-EOF
    AWS account id of the Atlas Hub this environment is connected to.
  EOF
}

variable "hub_cidr_block" {
  description = <<-EOF
    CIDR block of the Atlas Hub network.
  EOF
}

variable "hub_vpc_id" {
  description = <<-EOF
    VPC id of the Atlas Hub network.
  EOF
}

variable "hub_zone" {
  description = <<-EOF
    Hosted zone name of the Atlas Hub network.
  EOF
}

variable "wildcard_certificate_arn" {
  description = <<-EOF
    ARN for the wildcard certificate for the Atlas Production Environment.
  EOF
}
