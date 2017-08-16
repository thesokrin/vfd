# Atlas Redis Cluster Module - Variables

variable "ami_id" {
  default = "ami-9c9d3b8a"
  description = <<-EOF
    Base AMI for instances in cluster
  EOF
}
variable "cidr_block" {
  description = <<-EOF
    CIDR block of the Atlas Staging Environment
  EOF
}
variable "ec2_key_name" {
  default = "isre-shared"
  description = <<-EOF
    Key name for instances
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
variable "name" {
  default = "redis"
  description = <<-EOF
    Name of the module
  EOF
}
variable "primary_instance_type" {
  default = "r3.2xlarge"
  description = <<-EOF
    Instace types of the primaries
  EOF
}
variable "primary_root_volume_size" {
  default = "32"
  description = <<-EOF
    Volume size that will live on the primaries
  EOF
}
variable "primary_root_volume_type" {
  default = "gp2"
  description = <<-EOF
    Volume type that will live on the primaries
  EOF
}
variable "private_zone_id" {
  description = <<-EOF
    The private zone id for the Atlas Staging Environment.
  EOF
}
variable "project_name" {
  default = "redis_cluster"
  description = <<-EOF
    The project name that will be using this redis cluster
  EOF
}
variable "project_owner" {
  default = "isre"
  description = <<-EOF
    The project owner that is using this redis cluster
  EOF
}
variable "replica_count_per_primary" {
  description = <<-EOF
    The number of replicas per primary
  EOF
}
variable "replica_instance_type" {
  default = "r3.2xlarge"
  description = <<-EOF
    The type of instances that will be used as replicas
  EOF
}
variable "replica_root_volume_size" {
  default = "32"
  description = <<-EOF
    The volume size that will live on the replicas
  EOF
}
variable "replica_root_volume_type" {
  default = "gp2"
  description = <<-EOF
    The volumn type that will live on the replicas
  EOF
}
variable "reverse_zone_id" {
  description = <<-EOF
    The reverse zone id for the Atlas Staging Environment.
  EOF
}
variable "role_package" {
  default = "grindr-role-redis"
  description = <<-EOF
    The role package used to provision the instances
  EOF
}
variable "shard_indices" {
  default = [0, 1, 2]
  description = <<-EOF
    The index numbers for the shards. This is a hack because terraform doesn't support loops
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
