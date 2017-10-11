# Atlas Hub - Artemis Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    AWS account id of the Atlas Production Environment.
  EOF
}

variable "aws_region" {
  description = <<-EOF
    AWS region of the Atlas Production Environment.
  EOF
}

variable "asg_capacity" {
  description = <<-EOF
    Artemis instance count to maintain in the auto-scaling group.
  EOF
}

variable "cidr_block" {
  description = <<-EOF
    CIDR block of the Atlas Environment.
  EOF
}

variable "ec2_ami_id" {
  description = <<-EOF
    AMI ID in the same region as the VPC for Artemis instances.
  EOF
}

variable "env_name" {
  description = <<-EOF
    Long environment name.
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy environment name.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    Short environment name.
  EOF
}

variable "hub_cidr_block" {
  description = <<-EOF
    CIDR block of the Atlas Hub.
  EOF
}

variable "lahq_cidr_block" {
  description = <<-EOF
    CIDR block of LA HQ.
  EOF
}

variable "layer_dmz_cidr_blocks" {
  type = "list"
  description = <<-EOF
    List of three CIDR blocks for the subnets in the Atlas DMZ Layer.
  EOF
}

variable "layer_public_cidr_blocks" {
  type = "list"
  description = <<-EOF
    List of three CIDR blocks for the subnets in the Atlas Public Layer.
  EOF
}

variable "layer_public_subnet_ids" {
  type = "list"
  description = <<-EOF
    List of three subnet ids for the subnets in the Atlas Public Layer.
  EOF
}

variable "layer_services_cidr_blocks" {
  type = "list"
  description = <<-EOF
    List of three CIDR blocks for the subnets in the Atlas Services Layer.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    Hosted zone id for the private hosted zone.
  EOF
}

variable "realtime_elb_id" {
  description = <<-EOF
    ID of the Artemis real-time load balancer.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    VPC ID of the Atlas Environment.
  EOF
}

variable "web_elb_id" {
  description = <<-EOF
    ID of the Artemis web load balancer.
  EOF
}

variable "zone" {
  description = <<-EOF
    Hosted zone name for the Atlas Environment.
  EOF
}
