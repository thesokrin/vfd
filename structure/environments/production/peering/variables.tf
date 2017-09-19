# Atlas Production Environment - VPC Peering Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    The AWS account ID of the Atlas Production Environment.
  EOF
}

variable "env_dsci_account_id" {
  description = <<-EOF
    The AWS account Id of the Atlas Data-Science Environment.
  EOF
}

variable "env_dsci_cidr_block" {
  description = <<-EOF
    The CIDR block for the Atlas Data-Science Environment.
  EOF
}

variable "env_dsci_vpc_id" {
  description = <<-EOF
    The VPC ID of the Atlas Data-Science Environment.
  EOF
}

variable "env_dsci_zone" {
  description = <<-EOF
    The hosted zone of the Atlas Data-Science Environment.
  EOF
}

variable "env_oldprod_account_id" {
  description = <<-EOF
    AWS account id of the AWS account that old production lives in.
  EOF
}

variable "env_oldprod_cidr_block" {
  description = <<-EOF
    CIDR block for old production.
  EOF
}

variable "env_oldprod_vpc_id" {
  description = <<-EOF
    VPC id for old production.
  EOF
}

variable "env_oldprod_zone" {
  description = <<-EOF
    Hosted zone name for old production.
  EOF
}

variable "private_route_table_ids" {
  type = "list"
  description = <<-EOF
    A list of the 15 private route table ids in the Atlas Production Environment.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    The VPC ID of the Atlas Production Environment.
  EOF
}

variable "zone" {
  description = <<-EOF
    The hosted zone of the Atlas Production Environment.
  EOF
}
