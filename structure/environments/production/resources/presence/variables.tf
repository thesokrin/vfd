# Atlas Production Environment - Presence Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    AWS account id of the Atlas Production Environment.
  EOF
}

variable "aws_region" {
  description = <<-EOF
    AWS region of the Atlas Production Environment.
  EOF
}

variable "ec2_instance_type" {
  description = <<-EOF
    EC2 instance type for the Presence nodes.
  EOF
}

variable "env_cidr_block" {
  description = <<-EOF
    CIDR block of the Atlas Production Environment.
  EOF
}

variable "env_name" {
  description = <<-EOF
    Long name of the Atlas Production Environment.
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy name of the Atlas Production Environment.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    Short name of the Atlas Production Environment.
  EOF
}

variable "hub_cidr_block" {
  description = <<-EOF
    CIDR block of the Atlas Hub.
  EOF
}

variable "lahq_cidr_block" {
  description = <<-EOF
    CIDR block of LA HQ.
  EOF
}

variable "layer_dmz_cidr_blocks" {
  type = "list"
  description = <<-EOF
    List of three CIDR blocks in the Atlas DMZ Layer in the Atlas Production Environment.
  EOF
}

variable "layer_dmz_subnet_ids" {
  type = "list"
  description = <<-EOF
    List of three subnet ids in the Atlas DMZ Layer in the Atlas Production Environment.
  EOF
}

variable "layer_public_cidr_blocks" {
  type = "list"
  description = <<-EOF
    List of three CIDR blocks in the Atlas Public Layer in the Atlas Production Environment.
  EOF
}

variable "layer_services_cidr_blocks" {
  type = "list"
  description = <<-EOF
    List of three CIDR blocks in the Atlas Services Layer in the Atlas Production Environment.
  EOF
}

variable "layer_services_subnet_ids" {
  type = "list"
  description = <<-EOF
    List of three subnet ids in the Atlas Services Layer in the Atlas Production Environment.
  EOF
}

variable "presence_auth_host" {
  description = <<-EOF
    The DNS host name to use for Presence service authentication.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    Hosted zone id of the private zone in the Atlas Production Environment.
  EOF
}

variable "public_zone_id" {
  description = <<-EOF
    Hosted zone id of the public zone in the Atlas Production Environment.
  EOF
}

variable "reverse_zone_id" {
  description = <<-EOF
    Hosted zone id of the reverse zone in the Atlas Production Environment.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    VPC id of the Atlas Production Environment.
  EOF
}

variable "wildcard_certificate_arn" {
  description = <<-EOF
    ACM certificate ARN of the Atlas Production Environment's wildcard certificate.
  EOF
}

variable "zone" {
  description = <<-EOF
    Hosted zone name for the Atlas Production Environment.
  EOF
}
