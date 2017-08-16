# Chat Presence Module - Variables

variable "ebs_root_volume_size" {
  default = 32
  description = <<-EOF
    Size in gigabytes of the root volume for EC2 instances.
  EOF
}

variable "ebs_root_volume_type" {
  default = "gp2"
  description = <<-EOF
    EBS volume type for the root volume for EC2 instances.
  EOF
}

variable "ec2_ami_id" {
  default = "ami-1081b807"
  description = <<-EOF
    AMI id of an Ubuntu 14.04 AMI in the same region as the given Atlas Environment.
  EOF
}

variable "ec2_instance_type" {
  default = "c4.2xlarge"
  description = <<-EOF
    Instance type to launch for Presence nodes.
  EOF
}

variable "ec2_key_name" {
  default = "isre-shared"
  description = <<-EOF
    SSH key to associate with new instances.
  EOF
}

variable "env_cidr_block" {
  description = <<-EOF
    CIDR block of the Atlas Environment in which these resources reside.
  EOF
}

variable "env_name" {
  description = <<-EOF
    Long name of the Atlas Environment in which these resources reside
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy name of the Atlas Environment in which these resources reside.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    Short name of the Atlas Environment in which these resources reside.
  EOF
}

variable "hub_cidr_block" {
  description = <<-EOF
    CIDR block for the Atlas Hub.
  EOF
}

variable "instance_iam_role" {
  default = "atlas_ec2_assume_role"
  description = <<-EOF
    The IAM role to associate with EC2 instances in their instance profile.
  EOF
}

variable "lahq_cidr_block" {
  description = <<-EOF
    CIDR block of the LA HQ corporate network.
  EOF
}

variable "layer_dmz_cidr_blocks" {
  type = "list"
  description = <<-EOF
    List of three CIDR blocks for the Atlas DMZ Layer in the given Atlas Environment.
  EOF
}

variable "layer_dmz_subnet_ids" {
  type = "list"
  description = <<-EOF
    List of three subnet ids for the Atlas DMZ Layer in the given Atlas Environment.
  EOF
}

variable "layer_public_cidr_blocks" {
  type = "list"
  description = <<-EOF
    List of three CIDR blocks for the Atlas Public Layer in the given Atlas Environment.
  EOF
}

variable "layer_services_cidr_blocks" {
  type = "list"
  description = <<-EOF
    List of three CIDR blocks for the Atlas Services Layer in the given Atlas Environment.
  EOF
}

variable "layer_services_subnet_ids" {
  type = "list"
  description = <<-EOF
    List of three subnet ids in the Atlas Services Layer in the given Atlas Environment.
  EOF
}

variable "presence_auth_host" {
  description = <<-EOF
    The DNS host name to use for authentication for the Presence service.
  EOF
}

variable "presence_auth_port" {
  default = 443
  description = <<-EOF
    The TCP port over which to perform authentication for the Presence service.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    Hosted zone id of the private zone for the given Atlas Environment.
  EOF
}

variable "project_name" {
  default = "presence"
  description = <<-EOF
    The Atlas Project name for these resources.
  EOF
}

variable "project_name_fancy" {
  default = "Presence"
  description = <<-EOF
    The fancy Atlas Project Name for these resources.
  EOF
}

variable "project_owner" {
  default = "chat"
  description = <<-EOF
    Team responsible for billing costs of these resources.
  EOF
}

variable "public_zone_id" {
  description = <<-EOF
    Hosted zone id of the public zone for the given Atlas Environment.
  EOF
}

variable "reverse_zone_id" {
  description = <<-EOF
    Hosted zone id of the reverse zone for the given Atlas Environment.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    VPC id of the given Atlas Environment.
  EOF
}

variable "wildcard_certificate_arn" {
  description = <<-EOF
    ACM certificate ARN for the wildcard certificate covering this Atlas Environment.
  EOF
}

variable "zone" {
  description = <<-EOF
    Hosted zone name for the given Atlas Environment.
  EOF
}
