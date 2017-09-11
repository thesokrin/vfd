# Atlas Staging Environment - Elasticsearch Resources - Variables
variable "name" {
  description = <<-EOF
    Name that will used to derive our hostnames.
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
