# Atlas Data-Science Environment - VPC Peering Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    AWS Account ID of the Grindr 3.0 account.
  EOF
}

variable "env_prod_cidr_block" {
  description = <<-EOF
    CIDR block for the Atlas Production Environment.
  EOF
}

variable "env_prod_zone" {
  description = <<-EOF
    The hosted zone name for the Atlas Production Environment.
  EOF
}

variable "private_route_table_ids" {
  type = "list"
  description = <<-EOF
    A list of 15 private route table IDs in the Atlas Data-Science Environment.
  EOF
}

variable "prod_peering_connection_id" {
  description = <<-EOF
    The VPC peering connection id of the peering connection between the Atlas Production Environment and the Atlas
    Data-Science Environment.
  EOF
}
