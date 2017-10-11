# Atlas Production Environment - Elasticsearch Cascade Resources - Variables
variable "aws_region" {
  description = <<-EOF
    The AWS region where all of these resources will be provisioned.
  EOF
}

variable "name" {
  description = <<-EOF
    Name that will used to derive our hostnames.
  EOF
}

variable "env_name" {
  description = <<-EOF
    The long name of the Atlas Environment (staging)
  EOF
}

variable "asg_capacity" {
  description = <<-EOF
    Desired capacity of the Elasticsearch auto-scaling group.
  EOF
}

variable "project_name" {
  description = <<-EOF
    Name of the project this module or resource is a part of.
  EOF
}

variable "elasticsearch_cluster_id" {
  description = <<-EOF
    The unique tag value for Elasticsearch instances to cluster with.
  EOF
}

variable "project_owner" {
  default = "isre"

  description = <<-EOF
    Name of responsible party.
  EOF
}

variable "additional_cidr_blocks" {
  type = "list"

  description = <<-EOF
    A list of the CIDR blocks to grant access to modules.
  EOF
}
