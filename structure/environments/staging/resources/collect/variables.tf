# Atlas Staging Environment - Collect Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    AWS account id of the Atlas Staging Environment.
  EOF
}

variable "cidr_block" {
  description = <<-EOF
    CIDR block of the Atlas Staging Environment
  EOF
}

variable "env_name" {
  description = <<-EOF
    Long, slugified environment name of the Atlas Staging Environment (staging).
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy environment name of the Atlas Staging Environment.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    Short, slugified environment name of the Atlas Staging Environment.
  EOF
}

variable "layer_admin_subnet_ids" {
  type = "list"
  description = <<-EOF
    A list of three subnet ids in the admin layer of the Atlas Staging Environment.
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
    The private zone id for the Atlas Staging Environment.
  EOF
}

variable "reverse_zone_id" {
  description = <<-EOF
    The reverse zone id for the Atlas Staging Environment.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    The VPC ID of the Atlas Staging Environment.
  EOF
}

variable "zone" {
  description = <<-EOF
    The hosted zone name of the Atlas Staging Environment.
  EOF
}
