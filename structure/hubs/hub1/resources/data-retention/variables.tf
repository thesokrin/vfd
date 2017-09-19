# Atlas Hub - Data Retention Resources - Variables

variable "atlas_environment" {
  description = <<-EOF
    The full Atlas Environment name for the Atlas Hub (hub).
  EOF
}

variable "aws_account_id" {
  description = <<-EOF
    The AWS account id of the Atlas Hub.
  EOF
}

variable "bucket_name" {
  description = <<-EOF
    The bucket name to use for backing up found items.
  EOF
}

variable "ec2_instance_type" {
  description = <<-EOF
    The EC2 instance type to launch.
  EOF
}

variable "project_name" {
  description = <<-EOF
    Atlas Project name.
  EOF
}

variable "project_owner" {
  description = <<-EOF
    Team responsible for billing of these resources.
  EOF
}

variable "source_bucket_name" {
  description = <<-EOF
    Name of the source bucket to pull images from.
  EOF
}
