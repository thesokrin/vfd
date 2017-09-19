# Atlas Staging Environment - Redis Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    AWS account id of the Atlas Staging Environment.
  EOF
}

variable "ec2_instance_type" {
  description = <<-EOF
    This will be the instance type used for both primaries and replicas in the Redis Cluster.
  EOF
}

variable "env_cidr_block" {
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

variable "layer_admin_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three Admin CIDR blocks in the Atlas Staging Environment.
  EOF
}

variable "layer_data_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three Data CIDR blocks in the Atlas Staging Environment.
  EOF
}

variable "layer_data_subnet_ids" {
  type = "list"

  description = <<-EOF
    A list of three subnet ids in the admin layer of the Atlas Staging Environment.
  EOF
}

variable "layer_services_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three Services CIDR blocks in the Atlas Staging Environment.
  EOF
}
variable "additional_cidr_blocks" {
  type = "list"
  default = []
  description = <<-EOF
    Additional CIDR blocks to allow access to the default Redis port.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    The private zone id for the Atlas Staging Environment.
  EOF
}

variable "replica_count_per_primary" {
  description = <<-EOF
    Number of replicas to create per primary.
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

variable "name" {
  default = "redis"

  description = <<-EOF
    The name of this resource
  EOF
}
