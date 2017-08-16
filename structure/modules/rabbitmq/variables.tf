# Atlas RabbitMQ Module - Variables

variable "ec2_key_name" {
  default = "isre-shared"
  description = <<-EOF
    EC2 key-pair to install on the default user.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    Short name of the Atlas Production Environment.
  EOF
}

variable "env_name" {
  description = <<-EOF
    Long, slugified environment name of the Atlas Staging Environment (staging).
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy environment name of the Atlas Staging Environment.
  EOF
}

variable "project_name" {
  default = "rabbitmq"
  description = <<-EOF
    Name of the project this module or resource is a part of.
  EOF
}

variable "instance_count" {
  default = 0
  description = <<-EOF
    The number of instances to generate in the environment
  EOF
}

variable "ami_id" {
  default = "ami-9c9d3b8a"
  description = <<-EOF
    The latest atlas-trusty stable AMI in us-east-1.
  EOF
}

variable "package_role" {
  default = "grindr-role-rabbitmq"
  description = <<-EOF
    The role that will be launched via cloud init.
  EOF
}

variable "cidr_block" {
  description = <<-EOF
    CIDR block for the Atlas Stack in which this module is deployed.
  EOF
}

variable "layer_services_cidr_blocks" {
  type = "list"
  description = <<-EOF
    CIDR block for the Atlas services layer.
  EOF
}

variable "layer_data_cidr_blocks" {
  type = "list"
  description = <<-EOF
    CIDR block for the Atlas data layer.
  EOF
}

variable "layer_admin_cidr_blocks" {
  type = "list"
  description = <<-EOF
    CIDR block for the Atlas admin layer.
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
    An IAM role object to attach to the IAM instance profile of the rabbitmq host.
  EOF
}

variable "ec2_instance_type" {
  default = "c4.2xlarge"
  description = <<-EOF
    EC2 instance type for the rabbitmq instances.
  EOF
}

variable "layer_data_subnet_ids" {
  type = "list"
  description = <<-EOF
    List of three subnet ids for the data layer for this Atlas Stack.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    Route53 zone identifier for the private zone for this Atlas Stack.
  EOF
}

variable "reverse_zone_id" {
  description = <<-EOF
    Route53 zone identifier for the reverse zone for this Atlas Stack.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    VPC ID of the Atlas Stack this module is being launched in.
  EOF
}

variable "zone" {
  description = <<-EOF
    Hosted zone of the Atlas Stack this module is being launched in.
  EOF
}
