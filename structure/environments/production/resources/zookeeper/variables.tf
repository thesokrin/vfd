# Atlas Production Environment - Zookeeper Resources - Variables

variable "additional_exhibitor_cidr_blocks" {
  type = "list"
  description = <<-EOF
    The additional CIDR blocks to allow access to Exhibitor on port 8080.
  EOF
}

variable "additional_zookeeper_cidr_blocks" {
  type = "list"
  description = <<-EOF
    The additional CIDR blocks to allow access to Exhibitor on port 8080.
  EOF
}

variable "aws_region" {
  description = <<-EOF
    Region of the Atlas Production Environment.
  EOF
}

variable "aws_account_id" {
  description = <<-EOF
    AWS account id of the Atlas Production Environment.
  EOF
}

variable "artemis_sg_id" {
  description = <<-EOF
    Security group id of Artemis instances in the Atlas Production Environment to allow them access to Exhibitor.
  EOF
}

variable "cidr_block" {
  description = <<-EOF
    CIDR block of the Atlas Production Environment
  EOF
}

variable "env_name" {
  description = <<-EOF
    Long, slugified environment name of the Atlas Production Environment (production).
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy environment name of the Atlas Production Environment.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    Short, slugified environment name of the Atlas Production Environment.
  EOF
}

variable "layer_admin_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three Admin CIDR blocks in the Atlas Production Environment.
  EOF
}

variable "layer_admin_subnet_ids" {
  type = "list"

  description = <<-EOF
    A list of three subnet ids in the admin layer of the Atlas Production Environment.
  EOF
}

variable "layer_data_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three Data CIDR blocks in the Atlas Production Environment.
  EOF
}

variable "layer_services_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three Services CIDR blocks in the Atlas Production Environment.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    The private zone id for the Atlas Production Environment.
  EOF
}

variable "reverse_zone_id" {
  description = <<-EOF
    The reverse zone id for the Atlas Production Environment.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    The VPC ID of the Atlas Production Environment.
  EOF
}

variable "zone" {
  description = <<-EOF
    The hosted zone name of the Atlas Production Environment.
  EOF
}
