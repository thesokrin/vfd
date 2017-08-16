# Atlas NAT Gateway - Variables

variable "zone" {
  description = <<-EOF
    The zone name for the Atlas Stack this NAT Gateway targets.
  EOF
}

variable "dmz_subnet_ids" {
  type = "list"
  description = <<-EOF
    A list of DMZ subnet ids, aligned per availability zone.
  EOF
}

variable "private_route_table_ids" {
  type = "list"
  description = <<-EOF
    A list of route table ids corresponding to each subnet in private_subnet_ids.
  EOF
}
