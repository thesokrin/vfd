# Atlas Layer - Variables

variable "name" {
  description = <<-EOF
    The name of this Atlas Layer in lower case.

    This name should be one of the six known Atlas Layer types.
  EOF
}

variable "is_dmz" {
  default = false
  description = <<-EOF
    Whether to allocate internet-facing IP addresses for all instances in this layer.

    Only the DMZ Atlas Layer should have this value set to true.
  EOF
}

variable "cidr_mask_bits" {
  default = 7
  description = <<-EOF
    The number of bits to use in masking subnets in this Atlas Layer.

    To create a /24, this should be set to 8, as a /24 masks only 8 bits of the total 32 bit address space.
  EOF
}

variable "cidr_start" {
  description = <<-EOF
    The third IP octet to start from when creating subnets.

    Each subnet in an Atlas Layer will occupy a fixed size, as per the cidr_mask_bits variable above. This variable
    specifies where to start the third octet of the CIDR block of the first subnet created. Subsequent subnets octets
    will be calculated automatically.
  EOF
}

variable "stack_vpc_id" {
  description = <<-EOF
    ID of the Atlas Stack's VPC to launch resources in.
  EOF
}

variable "stack_cidr_block" {
  description = <<-EOF
    CIDR block of the Atlas Stack which this Atlas Layer is a member of.
  EOF
}

variable "stack_zone" {
  description = <<-EOF
    Hosted Zone of the Atlas Stack which this Atlas Layer belongs to.
  EOF
}

variable "availability_zones" {
  type = "map"
  default = {
    # grindr staging
    "886703752586.us-east-1" = [
      "us-east-1a",
      "us-east-1b",
      "us-east-1d"
    ]
    # grindr preprod account
    "202004573189.us-east-1" = [
      "us-east-1a",
      "us-east-1b",
      "us-east-1d"
    ]
    # grindr 2.0 account
    "284224159432.us-east-1" = [
      "us-east-1a",
      "us-east-1b",
      "us-east-1d"
    ]
    # grindr 3.0 account
    "058144102190.us-east-1" = [
      "us-east-1a",
      "us-east-1b",
      "us-east-1d"
    ]
  }
  description = <<-EOF
    A map of account ids to regions to availability zones.

    This is to overcome a bug in our 2.0 AWS account which lists an unavailable AZ as available in the API. AWS is
    unable to fix the issue. In short, account 284224159432 list us-east-1c as available, but as soon as something is
    launched there, it is rejected by the AWS API. It does not seem that Amazon is able to remove this AZ from our
    account, hence all of these horrible hardcoded values.
  EOF
}
