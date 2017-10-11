# Atlas Staging Environment - Peering Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    AWS account id of the Atlas Staging Environment.
  EOF
}

variable "aws_region" {
  description = <<-EOF
    AWS region of the Atlas Staging Environment.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    VPC ID of staging
  EOF
}

variable "zone" {
  description = <<-EOF
    The hosted zone of the Atlas Staging Environment.
  EOF
}

variable "private_route_table_ids" {
  type = "list"
  description = <<-EOF
    Private route table ids in staging for linking with peering
  EOF
}

variable "public_route_table_ids" {
  type = "list"
  description = <<-EOF
    Public route table ids in staging for linking with peering
  EOF
}

variable "env_preprod_account_id" {
  description = <<-EOF
    Account ID of preprod
  EOF
}

variable "env_preprod_vpc_id" {
  description = <<-EOF
    VPC ID of preprod
  EOF
}

variable "env_preprod_zone" {
  description = <<-EOF
    The hosted zone of the Atlas PreProd Environment.
  EOF
}

variable "env_preprod_cidr_block" {
  description = <<-EOF
    CIDR block for preprod.
  EOF
}
