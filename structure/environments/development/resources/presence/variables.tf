# Atlas Development Environment - Green Dot Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    AWS account ID of the Atlas Development Environment.
  EOF
}

variable "aws_region" {
  description = <<-EOF
    AWS region of the Atlas Development Environment.
  EOF
}

variable "ebs_root_volume_size" {
  description = <<-EOF
    Size in GiB of the root volume for EC2 instances.
  EOF
}

variable "ebs_root_volume_type" {
  description = <<-EOF
    EBS volume type for the root volume for EC2 instances.
  EOF
}

variable "ec2_ami_id" {
  description = <<-EOF
    AMI id in the same region as the Atlas Development Environment.
  EOF
}

variable "ec2_instance_type" {
  description = <<-EOF
    EC2 instance type to run.
  EOF
}

variable "ec2_key_name" {
  description = <<-EOF
    EC2 key name to use when creating instances.
  EOF
}

variable "env_cidr_block" {
  description = <<-EOF
    CIDR block of the Atlas Development Environment.
  EOF
}

variable "env_name" {
  description = <<-EOF
    Long enviroment name of the Atlas Development Environment (development).
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy environment name of the Atlas Development Environment.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    Short environment name of the Atlas Development Environment.
  EOF
}

variable "hub_cidr_block" {
  description = <<-EOF
    CIDR block of the Atlas Hub.
  EOF
}

variable "lahq_cidr_block" {
  description = <<-EOF
    CIDR block of Grindr LA HQ.
  EOF
}

variable "layer_dmz_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three CIDR blocks for the DMZ layer in the Atlas Development Environment.
  EOF
}

variable "layer_dmz_subnet_ids" {
  type = "list"

  description = <<-EOF
    List of three subnet ids for the DMZ layer in the Atlas Development Environment.
  EOF
}

variable "layer_public_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three CIDR blocks for the public layer in the Atlas Development Environment.
  EOF
}

variable "layer_services_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three CIDR blocks for the services layer in the Atlas Development Environment.
  EOF
}

variable "layer_services_subnet_ids" {
  type = "list"

  description = <<-EOF
    List of three subnet ids for the services layer in the Atlas Development Environment.
  EOF
}

variable "presence_auth_host" {
  description = <<-EOF
    FQDN of the host that Presence will use for authentication/authorization.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    Private hosted zone id for the Atlas Development Environment.
  EOF
}

variable "project_name" {
  description = <<-EOF
    Name of the Atlas project.
  EOF
}

variable "project_name_fancy" {
  description = <<-EOF
    Fancy name of the Atlas project.
  EOF
}

variable "project_owner" {
  description = <<-EOF
    Team responsible for billing of these resources.
  EOF
}

variable "public_zone_id" {
  description = <<-EOF
    Public hosted zone id for the Atlas Development Environment.
  EOF
}

variable "reverse_zone_id" {
  description = <<-EOF
    Reverse zone id for the Atlas Development Environment.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    VPC id of the Atlas Development Environment.
  EOF
}

variable "wildcard_certificate_arn" {
  description = <<-EOF
    Wildcard certificate ARN for the Atlas Development Environment.
  EOF
}

variable "zone" {
  description = <<-EOF
    Hosted zone name of the Atlas Development Environment.
  EOF
}
