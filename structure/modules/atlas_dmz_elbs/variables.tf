# Atlas DMZ Load Balancers Module - Variables

variable "certificate_arn" {
  description = <<-EOF
    The wildcard certificate ARN for the given Atlas Environment.
  EOF
}

variable "cross_zone_load_balancing" {
  default = false
  description = <<-EOF
    Whether cross-zone load balancing should be enabled on ELBs.
  EOF
}

variable "env_name" {
  description = <<-EOF
    Full environment name for the given Atlas Environment.
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy environment name for the given Atlas Environment.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    Short environment name for the given Atlas Environment.
  EOF
}

variable "layer_dmz_subnet_ids" {
  type = "list"
  description = <<-EOF
    A list of three subnets in the Atlas DMZ Layer for the given Atlas Environment.
  EOF
}

variable "project_name" {
  default = "loadbalancing"
  description = <<-EOF
    The Atlas Project name for this project.
  EOF
}

variable "project_owner" {
  default = "isre"
  description = <<-EOF
    The team responsible for billing of these project resources.
  EOF
}

variable "public_zone_id" {
  description = <<-EOF
    The public hosted zone id for the given Atlas Environment.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    The VPC id of the given Atlas Environment.
  EOF
}

variable "zone" {
  description = <<-EOF
    The hosted zone name for the given Atlas Environment.
  EOF
}
