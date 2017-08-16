# Atlas Environment - Input Variables

variable "id" {
  description = <<-EOF
    An integer from 1 to 254 describing the unique ID of this Atlas Environment.
  EOF
}

variable "name" {
  description = <<-EOF
    The name for this Atlas Environment.
  EOF
}

variable "name_short" {
  description = <<-EOF
    A short, slugified environment name to be used as a part of the hosted zone name for this Atlas Environment.
  EOF
}

variable "name_fancy" {
  description = <<-EOF
    A fancy environment name such as "Atlas Data-Science Environment".
  EOF
}

variable "hub_cidr_block" {
  description = <<-EOF
    The CIDR block for the Atlas Hub which this environment is connected to.
  EOF
}

variable "hub_zone" {
  description = <<-EOF
    The hosted zone for the hub for this environment.

    Typically ${region}.grindr.io.
  EOF
}

variable "hub_vpc_id" {
  description = <<-EOF
    The id of the hub VPC to create a VPC peering connection to.
  EOF
}

variable "hub_account_id" {
  description = <<-EOF
    The AWS account ID that this Atlas Environment's Hub is in.

    This is required so that VPC peering will work across accounts. Not all Atlas Environments will be in the same AWS
    account as the Atlas Hub.
  EOF
}
