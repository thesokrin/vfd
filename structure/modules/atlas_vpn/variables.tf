# Atlas VPN - Variables

variable "vpc_id" {
  description = <<-EOF
    VPC id of the VPC to create VPN resources for.
  EOF
}

variable "zone" {
  description = <<-EOF
    Hosted zone name of the Atlas Stack.
  EOF
}

variable "vpn_destination" {
  description = <<-EOF
    The destination of this VPN connection.
  EOF
}

variable "vpn_cidr_block" {
  description = <<-EOF
    CIDR block of the VPN destination network so that routes can be sent over the VPN connection.
  EOF
}

variable "bgp_asn" {
  description = <<-EOF
    BGP ASN for the VPN connection.
  EOF
}

variable "route_table_ids" {
  type = "list"
  description = <<-EOF
    Route table ids for 15 subnets which should be able to route traffic over this VPN connection.
  EOF
}
