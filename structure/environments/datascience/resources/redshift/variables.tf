# Atlas Data-Science Environment - Redshift Cluster Resources - Variables

variable "availability_zones" {
  type = "list"

  description = <<-EOF
    A list of the three availability zones where this environment lives.
  EOF
}

variable "aws_account_id" {
  description = <<-EOF
    The AWS account id of the Atlas Data-Science Environment.
  EOF
}

variable "aws_region" {
  description = <<-EOF
    The region this project runs in.
  EOF
}

variable "cidr_block" {
  description = <<-EOF
    The environment cidr block
  EOF
}

variable "env_name" {
  description = <<-EOF
    Full environment name for the Atlas Environment (datascience).
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy environment name for the Atlas Environment (datascience).
  EOF
}

variable "env_name_short" {
  type = "string"

  description = <<-EOF
    Short environment name for the Atlas Environment (dsci).
  EOF
}

variable "lahq_cidr_block" {
  description = <<-EOF
    CIDR block for the LA office.
  EOF
}

variable "layer_admin_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three Admin CIDR blocks in the Atlas Data-Science Environment.
  EOF
}

variable "layer_data_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three Data CIDR blocks in the Atlas Data-Science Environment.
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
    List of three Services CIDR blocks in the Atlas Data-Science Environment.
  EOF
}

variable "atlas_manager_ip" {
  description = <<-EOF
    Data-Science manager IP.
  EOF
}

variable "redshift_cluster_id" {
  description = <<-EOF
    Cluster unique key that identifies a cluster, will be stored as lower case.
  EOF
}

variable "redshift_cluster_type" {
  description = <<-EOF
    Cluster Type, ie Single Node or Multi Node.
  EOF
}

variable "redshift_database" {
  description = <<-EOF
    Optional database name that will create different database than dsci default database.
  EOF
}

variable "redshift_database_port" {
  description = <<-EOF
    Database port number to listen for connections
  EOF
}

variable "redshift_maintenance_window" {
  description = <<-EOF
    (Optional) The weekly time range (in UTC) during which automated cluster maintenance can occur.
  EOF
}

variable "redshift_node_count" {
  description = <<-EOF
    For multi node type, what is number of compute nodes, min 2, and max 32 for large, for xlarge 100 max.
  EOF
}

variable "redshift_node_type" {
  description = <<-EOF
    Node Type, dc1.large, dc1.8large, ds2.xlarge, ds2.8xlarge, ds1.xlarge, ds1.8xlarge.
  EOF
}

variable "redshift_password" {
  description = <<-EOF
    Database master password, Password must contain 8 to 64 printable ASCII characters excluding some characters. It must contain 1 uppercase letter, 1 lowercase letter, and 1 number
  EOF
}

variable "redshift_snapshot_retention_period" {
  description = <<-EOF
    (Optional) The number of days that automated snapshots are retained.
  EOF
}

variable "redshift_username" {
  description = <<-EOF
    Database master user, e.g awsuser
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    VPC ID of the Atlas Data-Science Environment.
  EOF
}

variable "zone" {
  description = <<-EOF
    The hosted zone name for the Atlas Data-Science Environment.
  EOF
}
