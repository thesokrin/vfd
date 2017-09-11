# Atlas Development Environment - Load Balancing Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    The AWS account id that the Atlas Development Environment lives in.
  EOF
}

variable "env_name" {
  description = <<-EOF
    The long environment name of this Atlas Environment (development).
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    The short, slugified name of this Atlas Environment (dev).
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    The fancy name of this Atlas Environment.
  EOF
}

variable "layer_dmz_subnet_ids" {
  type = "list"
  description = <<-EOF
    List of the three subnet IDs of the DMZ subnets in the Atlas Dev Environment.
  EOF
}

variable "public_zone_id" {
  description = <<-EOF
    ID of the Route 53 public hosted zone for the Atlas Dev Environment.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    ID of the Route 53 private hosted zone for the Atlas Dev Environment.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    ID of the VPC of the Atlas Dev Environment.
  EOF
}

variable "wildcard_certificate_arn" {
  description = <<-EOF
    ARN of the wildcard certificate for this hosted zone.
  EOF
}

variable "zone" {
  description = <<-EOF
    Hosted zone name for the Atlas Dev Environment.
  EOF
}
