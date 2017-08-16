# Atlas Redis Cluster Shard Module - Variables

variable "ami_id" {
  description = <<-EOF
    Base AMI for instances
  EOF
}

variable "ec2_key_name" {
  description = <<-EOF
    Key name for ec2 instances
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

variable "primary_instance_type" {
  description = <<-EOF
    Instance type of the ec2 instance
  EOF
}
variable "primary_subnet_id" {
  description = <<-EOF
    Primary subnet id for the environment
  EOF
}
variable "primary_root_volume_type" {
  description = <<-EOF
    Root volume type on the instance
  EOF
}
variable "primary_root_volume_size" {
  description = <<-EOF
    Size of the root volume
  EOF
}

variable "name" {
  default = "redis"
  description = <<-EOF
    The name that uniquely identifies this cluster in the given Atlas Environment.
  EOF
}

variable "iam_instance_profile" {
  description = <<-EOF
    The name of the iam instance profile for the redis cluster
  EOF
}

variable "security_group_ids" {
  type = "list"
  description = <<-EOF
    A list of security group ids
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    The private zone id to live in
  EOF
}

variable "project_name" {
  description = <<-EOF
    Project name that is using the cluster
  EOF
}

variable "project_owner" {
  description = <<-EOF
    The Team using the cluster
  EOF
}

variable "reverse_zone_id" {
  description = <<-EOF
    The reverse zone id
  EOF
}

variable "replica_count" {
  default = "2"
  description = <<-EOF
    The number of replicas per primary
  EOF
}

variable "replica_instance_type" {
  description = <<-EOF
    The type of instance to use for replicas
  EOF
}

variable "replica_subnet_ids" {
  type = "list"
  description = <<-EOF
    The subnet ids of the replica instances
  EOF
}

variable "replica_root_volume_type" {
  description = <<-EOF
    The volume type used on the replicas
  EOF
}
variable "replica_root_volume_size" {
  description = <<-EOF
    The size of the volume used on replicas
  EOF
}

variable "role_package" {
  description = <<-EOF
    The role package used to provision the machine
  EOF
}

variable "shard_id" {
  description = <<-EOF
    The Shard Id that this will create
  EOF
}

variable "zone" {
  description = <<-EOF
    The name of the zone where this cluster will live
  EOF
}
