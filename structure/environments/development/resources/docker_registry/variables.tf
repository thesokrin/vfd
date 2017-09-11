# Atlas Dev Environment - Docker Registry - Variables

variable "env_name" {
  description = <<-EOF
    The long environment name of the Atlas Dev Environment (development).
  EOF
}

variable "layer_admin_cidr_blocks" {
  type = "list"
  description = <<-EOF
    A list of the three admin CIDR blocks.
  EOF
}

variable "layer_public_cidr_blocks" {
  type = "list"
  description = <<-EOF
    A list of the three public CIDR blocks.
  EOF
}

variable "layer_services_cidr_blocks" {
  type = "list"
  description = <<-EOF
    A list of the three services CIDR blocks.
  EOF
}

variable "layer_services_subnet_ids" {
  type = "list"
  description = <<-EOF
    A list of the three subnet ids in services to launch the ELB in.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    Private hosted zone id of the Atlas Dev Environment.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    VPC ID of the Atlas Dev Environment.
  EOF
}

variable "wildcard_certificate_arn" {
  description = <<-EOF
    ARN of the *.dev.grindr.io wildcard certificate.
  EOF
}

variable "zone" {
  description = <<-EOF
    The hosted zone name for the Atlas Dev Environment.
  EOF
}
