# Atlas Data-Science Environment - Public Load-Balancing Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    AWS Account ID of the Atlas Data-Science Environment.
  EOF
}

variable "aws_region" {
  description = <<-EOF
    The region this project runs in.
  EOF
}

variable "env_name" {
  description = <<-EOF
    Long environment name of the Atlas Data-Science Environment (dsci).
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy environment name of the Atlas Data-Science Environment.
  EOF
}

variable "layer_dmz_subnet_ids" {
  type = "list"

  description = <<-EOF
    List of three subnet ids in the DMZ layer of the Atlas Data-Science Environment.
  EOF
}

variable "public_zone_id" {
  description = <<-EOF
    Public zone id for the Atlas Data-Science Environment.
  EOF
}

variable "wildcard_certificate_arn" {
  description = <<-EOF
    ARN of the wildcard certificate for *.dsci.grindr.io.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    VPC ID of the Atlas Data-Science Environment.
  EOF
}

variable "zone" {
  description = <<-EOF
    Hosted zone name for the Atlas Data-Science Environment.
  EOF
}
