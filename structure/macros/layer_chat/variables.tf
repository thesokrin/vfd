# Chat Layer Macro - Variables

variable "cidr_block" {
  description = <<-EOF
    CIDR block of the Atlas Environment which this layer belongs to.
  EOF
}

variable "hub_cidr_block" {
  description = <<-EOF
    CIDR block of the Atlas Hub which this Atlas Environment belongs to.
  EOF
}

variable "nat_gateway_ids" {
  type = "list"
  description = <<-EOF
    List of the NAT gateway IDs for each of the three AZs so that this layer can route to WAN.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    VPC id of the Atlas Environment which this layer belongs to.
  EOF
}

variable "vpc_peering_connection_id" {
  description = <<-EOF
    VPC peering connectiong linking this layer back to the Atlas Hub which this Atlas Environment is peered to.
  EOF
}

variable "zone" {
  description = <<-EOF
    Hosted zone name for the Atlas Environment this layer belongs to.
  EOF
}
