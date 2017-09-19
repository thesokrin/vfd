# Atlas Hub 1 - Atlas Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    AWS Account ID that the hub should live in.

    This should always be set to the Grindr 2.0 account id.
  EOF
}

variable "env_id" {
  description = <<-EOF
    The Atlas numerical identifier and second IP octet for this Atlas Hub.
  EOF
}

variable "env_name" {
  description = <<-EOF
    The name of this Atlas Hub (hub).
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    The short name of this Atlas Hub (hub).
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy name for the Atlas Hub.
  EOF
}

variable "wildcard_certificate_arn" {
  description = <<-EOF
    ARN for the wildcard certificate for the Atlas Hub.
  EOF
}
