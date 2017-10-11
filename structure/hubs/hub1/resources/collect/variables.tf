# Atlas Hub - Collect Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    AWS account id of the Atlas Hub.
  EOF
}

variable "additional_collect_ingress_cidr_blocks" {
  type = "list"
  description = <<-EOF
    A list of allowed CIDR blocks for sending logs to the Atlas Hub.
  EOF
}

variable "cidr_block" {
  description = <<-EOF
    CIDR block of the Atlas Hub.
  EOF
}

variable "env_name" {
  description = <<-EOF
    Long, slugified environment name of the Atlas Hub (hub).
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy environment name of the Atlas Hub.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    Short, slugified environment name of the Atlas Hub.
  EOF
}

variable "layer_admin_subnet_ids" {
  type = "list"
  description = <<-EOF
    A list of three subnet ids in the admin layer of the Atlas Hub.
  EOF
}

variable "logs_destination" {
  description = <<-EOF
    The destination for log forwarding, ie the Atlas Hub.
  EOF
}

variable "metrics_destination" {
  description = <<-EOF
    The destination for metrics forwarding, ie the Atlas Hub.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    The private zone id for the Atlas Hub.
  EOF
}

variable "reverse_zone_id" {
  description = <<-EOF
    The reverse zone id for the Atlas Hub.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    The VPC ID of the Atlas Hub.
  EOF
}

variable "zone" {
  description = <<-EOF
    The hosted zone name of the Atlas Hub.
  EOF
}
