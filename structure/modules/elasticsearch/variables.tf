# Atlas Elasticsearch Module - Variables

variable "name" {
  default = "elasticsearch"

  description = <<-EOF
    Name that will used to derive our hostnames.
  EOF
}

variable "asg_capacity" {
  default = 6

  description = <<-EOF
    Desired capacity of the Elasticsearch auto-scaling group.
  EOF
}

variable "cidr_block" {
  description = <<-EOF
    CIDR block of the Atlas Staging Environment
  EOF
}

variable "project_name" {
  default = "elasticsearch"

  description = <<-EOF
    Name of the project this module or resource is a part of.
  EOF
}

variable "project_owner" {
  default = "isre"

  description = <<-EOF
    The team responsible for billing of these resources.
  EOF
}

variable "ec2_instance_type" {
  default = "c3.8xlarge"

  description = <<-EOF
    EC2 instance type for the Elasticsearch instances.
  EOF
}

variable "ec2_keypair_name" {
  default = "isre-shared"

  description = <<-EOF
    EC2 keypair name for the Elasticsearch instances.
  EOF
}

variable "role_package" {
  default = "grindr-role-elasticsearch"

  description = <<-EOF
    The role that will be run by ansible.
  EOF
}

variable "ebs_root_volume_size" {
  default = 32

  description = <<-EOF
    Size in GB of the root EBS volume.
  EOF
}

variable "ebs_root_volume_type" {
  default = "gp2"

  description = <<-EOF
    Type of storage for the root EBS volume.
  EOF
}

variable "elasticsearch_cluster_id" {
  description = <<-EOF
    The unique tag value for Elasticsearch instances to cluster with.
  EOF
}

variable "env_name" {
  description = <<-EOF
    Long, slugified environment name of the Atlas Staging Environment (staging).
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Long, slugified environment name of the Atlas Staging Environment (staging).
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    Long, slugified environment name of the Atlas Staging Environment (staging).
  EOF
}

variable "reverse_zone_id" {
  default = "Z2HOUF98NNMQP3"

  description = <<-EOF
    The reverse zone id for the Atlas Staging Environment.
  EOF
}

variable "layer_admin_cidr_blocks" {
  type = "list"

  description = <<-EOF
    A list of the three CIDR blocks for the Atlas Admin Layer.
  EOF
}

variable "layer_data_cidr_blocks" {
  type = "list"

  description = <<-EOF
    A list of the three CIDR blocks for the Atlas Data Layer.
  EOF
}

variable "layer_data_subnet_ids" {
  type = "list"

  description = <<-EOF
    A list of the three subnet ids for the Atlas Data Layer.
  EOF
}

variable "layer_services_cidr_blocks" {
  type = "list"

  description = <<-EOF
    A list of the three CIDR blocks for the Atlas Services Layer.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    The private zone id of the internal DNS hosted zone.
  EOF
}

variable "ami_id" {
  # atlas-trusty-stable-2017-03-07T18-45-01Z
  default = "ami-9c9d3b8a"

  description = <<-EOF
    The latest atlas-trusty stable AMI in us-east-1.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    VPC id of the Atlas Environment which this is launching in.
  EOF
}

variable "zone" {
  description = <<-EOF
    Hosted zone name of the Atlas Environment which this is launching in.
  EOF
}
