# Atlas PreProd - MonkeyIsland resource - Variables

variable "name" {
  description = <<-EOF
    The name of the project that needs a CDN entry to an S3 bucket.
  EOF
}

variable "aws_account_id" {
  description = <<-EOF
    AWS account id of the Atlas Hub.
  EOF
}

variable "aws_region" {
  description = <<-EOF
    AWS region of the Atlas Production Environment.
  EOF
}

variable "env_name" {
  description = <<-EOF
    Long, slugified environment name of the Atlas Hub (hub).
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy environment name of the Atlas Hub.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    Short, slugified environment name of the Atlas Hub.
  EOF
}

variable "ec2_instance_count" {
  default = "3"

  description = <<-EOF
    Number of EC2 instances for static_service cluster.
  EOF
}

variable "lifecycle_rule_prefix" {
  default = ""

  description = <<-EOF
    Object key prefix identifying one or more objects to which the rule applies.
  EOF
}

variable "project_name" {
  default = "storage"
  description = <<-EOF
    The Atlas Project name for these resources.
  EOF
}

variable "project_owner" {
  default = "isre"
  description = <<-EOF
    The team responsible for the billing of these resources.
  EOF
}

variable "zone" {
  description = <<-EOF
    The zone name of the given Atlas Environment.
  EOF
}
