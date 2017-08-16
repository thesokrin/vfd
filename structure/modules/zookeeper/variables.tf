# Atlas Zookeeper Module - Variables

variable "additional_exhibitor_cidr_blocks" {
  type = "list"
  default = []
  description = <<-EOF
    The additional CIDR blocks to allow access to Exhibitor on port 8080.
  EOF
}

variable "additional_zookeeper_cidr_blocks" {
  type = "list"
  default = []
  description = <<-EOF
    The additional CIDR blocks to allow access to Exhibitor on port 8080.
  EOF
}

variable "ami_id" {
  default = "ami-9c9d3b8a"

  description = <<-EOF
    The latest atlas-trusty stable AMI in us-east-1.
  EOF
}

variable "artemis_sg_id" {
  description = <<-EOF
    Security group id of the Artemis cluster in the given Atlas Environment. Allows access from Artemis to Exhibitor.
  EOF
}

variable "cidr_block" {
  description = <<-EOF
    CIDR block for the Atlas Stack in which this module is deployed.
  EOF
}

variable "ebs_data_volume_size" {
  default = 100

  description = <<-EOF
    The EBS volume size for the ZooKeeper data files on instances.
  EOF
}

variable "ebs_data_volume_type" {
  default = "gp2"

  description = <<-EOF
    The EBS volume type for the ZooKeeper data files on instances.
  EOF
}

variable "ebs_root_volume_size" {
  default = 32

  description = <<-EOF
    The EBS volume size for the root filesystem on instances.
  EOF
}

variable "ebs_root_volume_type" {
  default = "gp2"

  description = <<-EOF
    The EBS root volume type for the root filesystem on instances.
  EOF
}

variable "ec2_iam_role" {
  default = "atlas_ec2_assume_role"

  description = <<-EOF
    An IAM role object to attach to the IAM instance profile of the zookeeper host.
  EOF
}

variable "ec2_instance_type" {
  default = "m4.2xlarge"

  description = <<-EOF
    EC2 instance type for the zookeeper instances.
  EOF
}

variable "ec2_instance_count" {
  default = "3"

  description = <<-EOF
    Number of EC2 instances for zookeeper cluster.
  EOF
}

variable "ec2_key_name" {
  default = "isre-shared"
  type    = "string"

  description = <<-EOF
    EC2 SSH Key Name
  EOF
}

variable "layer_admin_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three CIDR blocks for the Atlas Admin Layer in the given Atlas Environment.
  EOF
}

variable "layer_admin_subnet_ids" {
  type = "list"

  description = <<-EOF
    List of three subnet ids for the admin layer for this Atlas Stack.
  EOF
}

variable "layer_data_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three CIDR blocks for the Atlas Data Layer in the given Atlas Environment.
  EOF
}

variable "layer_services_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three CIDR blocks for the Atlas Services Layer in the given Atlas Environment.
  EOF
}

variable "name" {
  default = "zookeeper"

  description = <<-EOF
    Name that will used to derive our hostnames.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    Route53 zone identifier for the private zone for this Atlas Stack.
  EOF
}

variable "project_name" {
  default = "zookeeper"

  description = <<-EOF
    Name of the project.
  EOF
}

variable "project_owner" {
  default = "isre"

  description = <<-EOF
    Name of responsible party.
  EOF
}

variable "reverse_zone_id" {
  description = <<-EOF
    Route53 zone identifier for the reverse zone for this Atlas Stack.
  EOF
}

variable "env_name" {
  description = <<-EOF
    The long, slugified name of this Atlas Stack.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    The short, slugified three or four character name of this Atlas Stack.
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    The fancy name for this Atlas Stack.
  EOF
}

variable "role_package" {
  default = "grindr-role-zookeeper"

  description = <<-EOF
    The role that will be launched via cloud init.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    VPC ID of the Atlas Stack this module is being launched in.
  EOF
}

variable "zookeeper_heap_percent" {
  default = "66"
  description = <<-EOF
    Configures the percentage of total system memory used by the ZooKeeper heap.
  EOF
}

variable "zone" {
  description = <<-EOF
    Hosted zone of the Atlas Stack this module is being launched in.
  EOF
}
