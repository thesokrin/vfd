# Atlas Development Environment - Variables

variable "aws_account_id" {
  description = <<-EOF
    AWS account ID of the Atlas Data-Science Environment (should always be 3.0 account).
  EOF
}

variable "env_id" {
  description = <<-EOF
    The unique Atlas ID of the Atlas Data-Science Environment.
  EOF
}

variable "env_name" {
  description = <<-EOF
    Long environment name for the Atlas Data-Science Environment (datascience).
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy environment name for the Atlas Data-Science Environment.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    Short environment name for the Atlas Data-Science Environment (dsci).
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
