# Atlas Development Environment - Manager Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    AWS account ID of the Atlas Development Environment.
  EOF
}

variable "layer_dmz_cidr_blocks" {
  type = "list"
  description = <<-EOF
    List of three DMZ CIDR blocks in the Atlas Development Environment.
  EOF
}

variable "layer_dmz_subnet_ids" {
  type = "list"
  description = <<-EOF
    List of three DMZ subnet IDs in the Atlas Development Environment.
  EOF
}

variable "env_name" {
  description = <<-EOF
    Long Atlas Environment name of the Development environment (development).
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy name for this environment "Atlas Development Environment".
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    Short Atlas Environment name of the Development environment (dev).
  EOF
}

variable "public_zone_id" {
  description = <<-EOF
    Public hosted zone id of the Atlas Development Environment.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    Private hosted zone id of the Atlas Development Environment.
  EOF
}

variable "reverse_zone_id" {
  description = <<-EOF
    Reverse hosted zone id for the Atlas Development Environment.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    VPC ID of the Atlas Development Environment.
  EOF
}

variable "zone" {
  description = <<-EOF
    Hosted zone name of the Atlas Development Environment.
  EOF
}
