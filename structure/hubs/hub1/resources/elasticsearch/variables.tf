# Atlas Hub - Elasticsearch Resources - Variables

variable "asg_capacity" {
  description = <<-EOF
    Desired capacity of the Elasticsearch auto-scaling group.
  EOF
}

variable "aws_account_id" {
  description = <<-EOF
    AWS account ID of the account resources will live in, should always be the 2.0 account.
  EOF
}

variable "ec2_instance_type" {
  description = <<-EOF
    EC2 instance type for the Elasticsearch instances.
  EOF
}

variable "ec2_keypair_name" {
  description = <<-EOF
    EC2 keypair name for the Elasticsearch instances.
  EOF
}

variable "ebs_root_volume_size" {
  description = <<-EOF
    Size in GB of the root EBS volume.
  EOF
}

variable "ebs_root_volume_type" {
  description = <<-EOF
    Type of storage for the root EBS volume.
  EOF
}

variable "elasticsearch_cluster_id" {
  description = <<-EOF
    The unique tag value for Elasticsearch instances to cluster with.
  EOF
}

variable "hub_cidr_block" {
  description = <<-EOF
    Atlas Hub CIDR block.
  EOF
}

variable "hub_name" {
  description = <<-EOF
    The name of the hub, "hub".
  EOF
}

variable "lahq_cidr_block" {
  description = <<-EOF
    CIDR block for the LA HQ office.
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
  description = <<-EOF
    The latest atlas-trusty-stable AMI in us-east-1.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    VPC id of the Atlas Hub.
  EOF
}

variable "zone" {
  description = <<-EOF
    Hosted zone name of the Atlas Hub.
  EOF
}
