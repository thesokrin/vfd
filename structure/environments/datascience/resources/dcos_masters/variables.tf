# Atlas Data-Science Environment - DC/OS Masters - Variables

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
    The CIDR block for the Atlas Data-Science environment.
  EOF
}

variable "coreos_ami_id" {
  type = "string"

  description = <<-EOF
    CoreOS Stable AMI ID in us-east-1.
  EOF
}

variable "dash_elb_id" {
  type = "string"

  description = <<-EOF
    The ID of the dash.dsci.grindr.io load balancer.
  EOF
}

variable "dcos_bootstrap_id" {
  type = "string"

  description = <<-EOF
    A secret hash that DC/OS uses to prevent their customers from using their open source edition.
  EOF
}

variable "ebs_root_volume_size" {
  type = "string"

  description = <<-EOF
    Size in gigabytes of the root EBS volume for EC2 instances.
  EOF
}

variable "ebs_root_volume_type" {
  type = "string"

  description = <<-EOF
    Type of the EBS volume to use for the root volume on the EC2 instances.
  EOF
}

variable "ebs_var_lib_volume_size" {
  type = "string"

  description = <<-EOF
    EBS volume size for the /var/lib filesystem.
  EOF
}

variable "ebs_var_lib_volume_type" {
  type = "string"

  description = <<-EOF
    EBS volume type for the /var/lib filesystem.
  EOF
}

variable "ec2_instance_type" {
  description = <<-EOF
    Instance type to use for the masters.
  EOF
}

variable "env_id" {
  description = <<-EOF
    The ID of the Atlas Data-Science Environment.
  EOF
}

variable "env_name" {
  type = "string"

  description = <<-EOF
    Full environment name for the Atlas Environment (datascience).
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy environment name of the Atlas Data-Science Environment.
  EOF
}

variable "env_name_short" {
  type = "string"

  description = <<-EOF
    Short environment name for the Atlas Environment (dsci).
  EOF
}

variable "hub_cidr_block" {
  description = <<-EOF
    CIDR block for the Atlas Hub.
  EOF
}

variable "ec2_key_name" {
  type = "string"

  description = <<-EOF
    EC2 SSH Key Name
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
    A list of three CIDR blocks for the admin subnets in the Atlas Data-Science environment.
  EOF
}

variable "layer_admin_subnet_ids" {
  type = "list"

  description = <<-EOF
    A list of three subnets, one per availability zone, for the admin layer.
  EOF
}

variable "layer_dmz_cidr_blocks" {
  type = "list"

  description = <<-EOF
    A list of CIDR blocks for the DMZ Atlas Layer.
  EOF
}

variable "layer_public_cidr_blocks" {
  type = "list"

  description = <<-EOF
    A list of three CIDR blocks for the public subnets in the Atlas Data-Science environment.
  EOF
}

variable "layer_services_cidr_blocks" {
  type = "list"

  description = <<-EOF
    A list of three CIDR blocks for the services subnets in the Atlas Data-Science environment.
  EOF
}

variable "private_zone_id" {
  type = "string"

  description = <<-EOF
    Route53 Private zone ID for this zone
  EOF
}

variable "reverse_zone_id" {
  type = "string"

  description = <<-EOF
    Route53 private PTR zone
  EOF
}

variable "vpc_id" {
  type = "string"

  description = <<-EOF
    VPC ID for this environment
  EOF
}

variable "zone" {
  type = "string"

  description = <<-EOF
    Hosted zone for this Atlas Data-Science Environment.
  EOF
}
