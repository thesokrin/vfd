# Atlas Hub - Manager Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    AWS account ID of the Atlas Hub.
  EOF
}

variable "layer_dmz_cidr_blocks" {
  type = "list"
  description = <<-EOF
    List of three DMZ CIDR blocks in the Atlas Hub.
  EOF
}

variable "layer_dmz_subnet_ids" {
  type = "list"
  description = <<-EOF
    List of three DMZ subnet IDs in the Atlas Hub.
  EOF
}

variable "env_name" {
  description = <<-EOF
    Long name of the Atlas Hub (hub).
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy name "Atlas Hub".
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    Short name of the Atlas Hub (hub).
  EOF
}

variable "public_zone_id" {
  description = <<-EOF
    Public hosted zone id of the Atlas Hub.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    Private hosted zone id of the Atlas Hub.
  EOF
}

variable "reverse_zone_id" {
  description = <<-EOF
    Reverse hosted zone id for the Atlas Hub.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    VPC ID of the Atlas Hub.
  EOF
}

variable "zone" {
  description = <<-EOF
    Hosted zone name of the Atlas Hub.
  EOF
}
