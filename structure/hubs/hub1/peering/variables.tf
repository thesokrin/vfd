# Atlas Hub - VPC Peering Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    The AWS account ID of the Atlas Hub.
  EOF
}

variable "aws_region" {
  description = <<-EOF
    The AWS region of the Atlas Hub.
  EOF
}

variable "private_route_table_ids" {
  type = "list"
  description = <<-EOF
    A list of 15 route table ids for all private subnets of the Atlas Hub.
  EOF
}

variable "aws_account_ids" {
  type = "map"
  description = <<-EOF
    A mapping of short environment names to their associated AWS account IDs.
  EOF
}

variable "cidr_blocks" {
  type = "map"
  description = <<-EOF
    A mapping of short environment names to their CIDR blocks.
  EOF
}

variable "environment_names" {
  type = "map"
  description = <<-EOF
    A mapping of short environment names to long environment names.
  EOF
}

variable "environments" {
  type = "list"
  description = <<-EOF
    A list of short environment names for peering.
  EOF
}

variable "vpc_ids" {
  type = "map"
  description = <<-EOF
    A mapping of short environment names to their VPC ids.
  EOF
}

variable "vpc_peering_connections" {
  type = "map"
  description = <<-EOF
    A mapping of short environment names to their VPC peering connection ids.
  EOF
}

variable "zones" {
  type = "map"
  description = <<-EOF
    A mapping of short environment names to their hosted zone names.
  EOF
}
