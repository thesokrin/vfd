# Atlas Development Environment - Peering Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    AWS account id of the Atlas Development Environment.
  EOF
}

variable "aws_region" {
  description = <<-EOF
    AWS region of the Atlas Development Environment.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    The vpc_id of development that will be used for peering
  EOF
}

variable "zone" {
  description = <<-EOF
    The zone for development to be used for tagging
  EOF
}

variable "public_route_table_ids" {
  type = "list"
  description = <<-EOF
    The development public route table ids to be linked to the Preprod VPC
    so that they know about that VPC.
  EOF
}

variable "private_route_table_ids" {
  type = "list"
  description = <<-EOF
    The development private route table ids to be linked to the Preprod VPC
    so that they know about that VPC.
  EOF
}

variable "env_preprod_account_id" {
  description = <<-EOF
    The Preprod account id, because the peering connection needs it specified even if its the same
    account
  EOF
}

variable "env_preprod_vpc_id" {
  description = <<-EOF
    The Preprod VPC that we want the Development VPC to be peered to.
  EOF
}

variable "env_preprod_zone" {
  description = <<-EOF
    Preprod's zone name, used for tagging
  EOF
}

variable "env_preprod_cidr_block" {
  description = <<-EOF
    The Preprod cidr block that the Dev Route Tables need to know about.
  EOF
}
