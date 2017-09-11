# Atlas Staging Environment - Aurora Cluster Resources - Variables

variable "atlas_project" {
  description = <<-EOF
    What the project is for, short one word description, ie redis, elasticsearch, aurora.
  EOF
}

variable "atlas_owner" {
  description = <<-EOF
    The person/group who requested resource.
  EOF
}

variable "aws_account_id" {
  description = <<-EOF
    The AWS account id of the Atlas Staging Environment.
  EOF
}

variable "aws_region" {
  description = <<-EOF
    The region this project runs in.
  EOF
}

variable "env_name" {
  description = <<-EOF
    Full environment name for the Atlas Environment (staging).
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy environment name for the Atlas Environment (staging).
  EOF
}

variable "env_name_short" {
  type = "string"

  description = <<-EOF
    Short environment name for the Atlas Environment (stg).
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
    A list of three subnet ids for subnets in the services Atlas Layer in the Atlas Data Science Environment.
  EOF
}

variable "layer_services_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three Services CIDR blocks in the Atlas Staging Environment.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    The private zone id for the Atlas Staging Environment.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    VPC ID of the Atlas Staging Environment.
  EOF
}

variable "zone" {
  description = <<-EOF
    The hosted zone name for the Atlas Staging Environment.
  EOF
}

# Main Aurora Variables
variable "main_backup_retention_period" {
  description = <<-EOF
    (Optional) The days to retain backups for. Default set by module is 7.
  EOF
}

variable "main_cluster_id" {
  description = <<-EOF
    Cluster unique key that identifies a cluster, must be lower case.
  EOF
}

variable "main_password" {
  description = <<-EOF
    Database master password, Password must contain 8 to 64 printable ASCII characters excluding some characters. It must contain 1 uppercase letter, 1 lowercase letter, and 1 number
  EOF
}

variable "main_skip_final_snapshot" {
  default = false

  description = <<-EOF
    (Optional) Determines whether a final DB snapshot is created before the DB cluster is deleted.
  EOF
}
