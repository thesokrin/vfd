# Atlas Hub - Nagios Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    AWS account id of the Atlas Hub.
  EOF
}

variable "aws_region" {
  description = <<-EOF
    AWS region of the Atlas Hub.
  EOF
}

variable "ebs_root_volume_size" {
  description = <<-EOF
    Size in gigabytes of the root EBS volume for instances.
  EOF
}

variable "ebs_root_volume_type" {
  description = <<-EOF
    Type of EBS storage for the root volume.
  EOF
}

variable "ec2_ami_id" {
  description = <<-EOF
    AMI id in the same region as the Atlas Hub for Ubuntu 14.04.
  EOF
}

variable "ec2_instance_type" {
  description = <<-EOF
    EC2 instance type for the Nagios server.
  EOF
}

variable "ec2_key_name" {
  description = <<-EOF
    Key-pair to associate with the EC2 instance.
  EOF
}

variable "env_cidr_block" {
  description = <<-EOF
    CIDR block for the Atlas Hub.
  EOF
}

variable "env_name" {
  description = <<-EOF
    Long name of the Atlas Hub.
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    Fancy name of the Atlas Hub.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    Short name of the Atlas Hub.
  EOF
}

variable "lahq_cidr_block" {
  description = <<-EOF
    CIDR block for LA HQ.
  EOF
}

variable "layer_admin_subnet_ids" {
  type = "list"
  description = <<-EOF
    List of three subnet ids in the Atlas Admin Layer in the Atlas Hub.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    Hosted zone id for the private hosted zone for the Atlas Hub.
  EOF
}

variable "reverse_zone_id" {
  description = <<-EOF
    Hosted zone id for the reverse hosted zone for the Atlas Hub.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    VPC id of the Atlas Hub.
  EOF
}

variable "zone" {
  description = <<-EOF
    Hosted zone name for the Atlas Hub.
  EOF
}
