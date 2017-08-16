# Atlas RDS Cluster Module - Variables

variable "apply_immediately" {
  default = false

  description = <<-EOF
    (Optional) Specifies whether any cluster modifications are applied immediately, or during the next maintenance window.
  EOF
}

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

variable "backup_retention_period" {
  default = "7"

  description = <<-EOF
    (Optional) The days to retain backups for.
  EOF
}

variable "cluster_id" {
  description = <<-EOF
    Cluster unique key that identifies a cluster, must be lower case.
  EOF
}

variable "database_name" {
  default = ""

  description = <<-EOF
    Optional database name that will create different database than dsci default database.
  EOF
}

variable "database_port" {
  default = "3306"

  description = <<-EOF
    Database port number to listen for connections
  EOF
}

variable "env_name" {
  description = <<-EOF
    Full environment name for the Atlas Environment, i.e. datascience, staging.
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy environment name for the Atlas Environment, i.e. Data Science, Staging.
  EOF
}

variable "env_name_short" {
  type = "string"

  description = <<-EOF
    Short environment name for the Atlas Environment, i.e. dsci, stg.
  EOF
}

variable "instance_class_master" {
  default = "db.r3.4xlarge"

  description = <<-EOF
    Instance Class, db.t2.medium, db.r3.large, db.r3.xlarge, db.r3.2xlarge, db.r3.4xlarge, db.r3.8xlarge.
  EOF
}

variable "instance_class_slave" {
  default = "db.r3.4xlarge"

  description = <<-EOF
    Instance Class, db.t2.medium, db.r3.large, db.r3.xlarge, db.r3.2xlarge, db.r3.4xlarge, db.r3.8xlarge.
  EOF
}

variable "instance_class_reporting" {
  default = "db.r3.4xlarge"

  description = <<-EOF
    Instance Class, db.t2.medium, db.r3.large, db.r3.xlarge, db.r3.2xlarge, db.r3.4xlarge, db.r3.8xlarge.
  EOF
}

variable "layer_admin_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three Admin CIDR blocks in the Atlas Environment.
  EOF
}

variable "layer_data_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three Data CIDR blocks in the Atlas Environment.
  EOF
}

variable "layer_data_subnet_ids" {
  type = "list"

  description = <<-EOF
    A list of three subnet ids for subnets in the services Atlas Layer in the Atlas Environment.
  EOF
}

variable "layer_services_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three Services CIDR blocks in the Atlas Environment.
  EOF
}

variable "additional_aurora_cidr_blocks" {
  type = "list"
  default = []

  description = <<-EOF
    List of additional CIDR blocks to allow access to aurora
  EOF
}

variable "maintenance_window" {
  default = "tue:05:16-tue:05:46"

  description = <<-EOF
    (Optional) The weekly time range (in UTC) during which automated cluster maintenance can occur.
  EOF
}

variable "masters_instance_count" {
  default = "2"

  description = <<-EOF
    Number of master db instances for rds cluster.
  EOF
}

variable "parameter_group_family" {
  default = "aurora5.6"

  description = <<-EOF
    The family of the DB cluster parameter group.
  EOF
}

variable "password" {
  description = <<-EOF
    Database master password, Password must contain 8 to 64 printable ASCII characters excluding some characters. It must contain 1 uppercase letter, 1 lowercase letter, and 1 number
  EOF
}

variable "pgc_character_set_connection" {
  default = "utf8mb4"

  description = <<-EOF
    The character set used for literals that do not have a character set introducer and for number-to-string conversion.
  EOF
}

variable "pgc_character_set_database" {
  default = "utf8mb4"

  description = <<-EOF
    The character set used by the default database.
  EOF
}

variable "pgc_character_set_server" {
  default = "utf8mb4"

  description = <<-EOF
    The server's default character set.
  EOF
}

variable "pgi_max_connections" {
  default = "16000"

  description = <<-EOF
    The number of simultaneous client connections allowed.
  EOF
}

variable "preferred_backup_window" {
  default = "07:15-07:45"

  description = <<-EOF
    (Optional) The daily time range during which automated backups are created if automated backups are enabled using the BackupRetentionPeriod parameter
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    Route53 zone identifier for the private zone for this Atlas Stack.
  EOF
}

variable "publicly_accessible" {
  default = false

  description = <<-EOF
    (Optional) Bool to control if instance is publicly accessible.
  EOF
}

variable "reporting_instance" {
  default = true

  description = <<-EOF
    If set to true will create reporting instance.
  EOF
}

variable "skip_final_snapshot" {
  default = false

  description = <<-EOF
    (Optional) Determines whether a final DB snapshot is created before the DB cluster is deleted.
  EOF
}

variable "slaves_instance_count" {
  default = "3"

  description = <<-EOF
    Number of slave db instances for rds cluster.
  EOF
}

variable "username" {
  default = "isre_admin"

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
