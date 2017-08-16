# Atlas Redis Cluster Resources Module - Variables

variable "additional_cidr_blocks" {
  type = "list"
  default = []
  description = <<-EOF
    Additional CIDR blocks to allow access to the default Redis port.
  EOF
}

variable "cidr_block" {
  description = <<-EOF
    CIDR block for the Atlas Stack in which this module is deployed.
  EOF
}

variable "ec2_iam_role" {
  default = "atlas_ec2_assume_role"

  description = <<-EOF
    An IAM role object to attach to the IAM instance profile of the redis host.
  EOF
}

variable "env_name" {
  description = <<-EOF
    The long, slugified name of this Atlas Stack.
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    The fancy name for this Atlas Stack.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    The short, slugified three or four character name of this Atlas Stack.
  EOF
}

variable "layer_admin_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three CIDR blocks for the Atlas Admin Layer in the given Atlas Environment.
  EOF
}

variable "layer_data_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three CIDR blocks for the Atlas Data Layer in the given Atlas Environment.
  EOF
}

variable "layer_services_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three CIDR blocks for the Atlas Services Layer in the given Atlas Environment.
  EOF
}

variable "name" {
  default = "redis"
  description = <<-EOF
    The name of this Redis Cluster instance.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    Route53 zone identifier for the private zone for this Atlas Stack.
  EOF
}

variable "project_name" {
  default = "redis_cluster"

  description = <<-EOF
    Name of the project this module or resource is a part of.
  EOF
}

variable "project_owner" {
  default = "isre"
  description = <<-EOF
    The team name responsible for the billing of this set of resources.
  EOF
}

variable "reverse_zone_id" {
  description = <<-EOF
    Route53 zone identifier for the reverse zone for this Atlas Stack.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    VPC ID of the Atlas Stack this module is being launched in.
  EOF
}

variable "zone" {
  description = <<-EOF
    Hosted zone of the Atlas Stack this module is being launched in.
  EOF
}
