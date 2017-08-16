# Atlas Redis Cluster DNS Module - Variables

variable "name" {
  description = <<-EOF
  EOF
}
variable "primary_dns_names" {
  type = "list"
  description = <<-EOF
    The dns names of the primary nodes
  EOF
}
variable "primary_ips" {
  type = "list"
  description = <<-EOF
    The ip addresses of the primary nodes
  EOF
}
variable "private_zone_id" {
  description = <<-EOF
    The private zone id of this environment
  EOF
}
variable "replica_ips" {
  type = "list"
  description = <<-EOF
    The ip addresses of all replicas
  EOF
}
variable "replica_dns_names" {
  type = "list"
  description = <<-EOF
    The names of individual replica node DNS entries for each replica attached to each primary.
  EOF
}
variable "replica_pool_dns_names" {
  type = "list"
  description = <<-EOF
    The names of DNS entries for each replica pool attached to each primary, one read pool per primary.
  EOF
}
variable "zone" {
  description = <<-EOF
    Hosted zone name of the given Atlas Environment.
  EOF
}
