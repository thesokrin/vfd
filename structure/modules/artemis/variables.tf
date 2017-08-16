# Atlas Artemis Module - Variables

variable "capacity" {
  default = 3
  description = <<-EOF
    Artemis instance count to maintain in the auto-scaling group.
  EOF
}

variable "ebs_root_volume_size" {
  default = 32
  description = <<-EOF
    EBS volume size in GiB for the root volume on EC2 instances.
  EOF
}

variable "ebs_root_volume_type" {
  default = "gp2"
  description = <<-EOF
    EBS volume type for the root volume on EC2 instances.
  EOF
}

variable "ec2_ami_id" {
  default = "ami-9c9d3b8a"
  description = <<-EOF
    AMI ID in the same region as the VPC for Artemis instances.
  EOF
}

variable "ec2_instance_type" {
  default = "c4.2xlarge"
  description = <<-EOF
    EC2 instance type for Artemis instances.
  EOF
}

variable "ec2_keypair_name" {
  default = "isre-shared"
  description = <<-EOF
    Name of the EC2 keypair for EC2 instances.
  EOF
}

variable "cidr_block" {
  description = <<-EOF
    CIDR block of the target Atlas Environment.
  EOF
}

variable "env_name" {
  description = <<-EOF
    Long environment name of the Atlas Environment.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    Short, slugified environment name of the Atlas Environment.
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy environment name of the Atlas Enviroment.
  EOF
}

variable "hub_cidr_block" {
  description = <<-EOF
    CIDR block of the Atlas Hub.
  EOF
}

variable "iam_role" {
  default = "atlas_ec2_assume_role"
  description = <<-EOF
    The IAM role to attach to Artemis instance profiles.
  EOF
}

variable "lahq_cidr_block" {
  description = <<-EOF
    The CIDR block for Grindr LA HQ.
  EOF
}

variable "layer_dmz_cidr_blocks" {
  type = "list"
  description = <<-EOF
    List of three CIDR blocks for subnets in the Atlas DMZ Layer.
  EOF
}

variable "layer_public_cidr_blocks" {
  type = "list"
  description = <<-EOF
    List of three CIDR blocks for subnets in the Atlas Public Layer.
  EOF
}

variable "layer_public_subnet_ids" {
  type = "list"
  description = <<-EOF
    List of three subnet ids for subnets in the Atlas Public Layer.
  EOF
}

variable "layer_services_cidr_blocks" {
  type = "list"
  description = <<-EOF
    List of three subnet ids for subnets in the Atlas Services Layer.
  EOF
}

variable "name" {
  default = "artemis"
  description = <<-EOF
    The name of the created Artemis cluster.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    Hosted zone id for the given Atlas Environment's private hosted zone.
  EOF
}

variable "project_name" {
  default = "artemis"
  description = <<-EOF
    The project name which this module lives in.
  EOF
}

variable "project_name_fancy" {
  default = "Artemis"
  description = <<-EOF
    The fancy project name which this module lives in.
  EOF
}

variable "project_owner" {
  default = "isre"
  description = <<-EOF
    Team name of the team owning the billing costs for these resources.
  EOF
}

variable "realtime_elb_id" {
  description = <<-EOF
    Name of the real-time WAN-facing websocket load balancer in the Atlas DMZ Layer.
  EOF
}

variable "role_package" {
  default = "grindr-role-artemis"
  description = <<-EOF
    The role that will be run by ansible.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    VPC ID of the given Atlas Environment.
  EOF
}

variable "wildcard_certificate_arn" {
  description = <<-EOF
    Wildcard certificate ARN for the given Atlas Environment.
  EOF
}

variable "web_elb_id" {
  description = <<-EOF
    Name of the web WAN-facing load balancer in the Atlas DMZ Layer.
  EOF
}

variable "zone" {
  description = <<-EOF
    The hosted zone name of this Atlas Environment.
  EOF
}
