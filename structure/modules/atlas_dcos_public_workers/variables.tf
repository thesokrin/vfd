# Atlas DC/OS Public Workers Module - Variables

variable "asg_capacity" {
  description = <<-EOF
    Number of servers to keep active in the auto-scaling group.
  EOF
}

variable "cidr_block" {
  description = <<-EOF
    The CIDR block for the Atlas Stack.
  EOF
}

variable "coreos_ami_id" {
  default = "ami-4d795c5a"
  type    = "string"

  description = <<-EOF
    AMI ID of the Core OS AMI in the us-east-1 region to use in the auto-scaling group.
  EOF
}

variable "dcos_bootstrap_id" {
  default = "e73ba2b1cd17795e4dcb3d6647d11a29b9c35084"
  type    = "string"

  description = <<-EOF
    A secret hash that DC/OS uses to prevent their customers from using their open source edition.
  EOF
}

variable "dynamic_port_end" {
  default = "10100"
  type    = "string"

  description = <<-EOF
    End of the dynamic port range for Marathon LB.
  EOF
}

variable "dynamic_port_start" {
  default = "10000"
  type    = "string"

  description = <<-EOF
    Start of the dynamic port range for Marathon LB.
  EOF
}

variable "ebs_root_volume_size" {
  default = "32"
  type    = "string"

  description = <<-EOF
    EBS volume size in gigabytes for the root filesystem.
  EOF
}

variable "ebs_root_volume_type" {
  default = "gp2"
  type    = "string"

  description = <<-EOF
    EBS volume type for the root filesystem.
  EOF
}

variable "ebs_var_lib_volume_size" {
  default = "100"
  type    = "string"

  description = <<-EOF
    EBS volume size for the /var/lib filesystem.
  EOF
}

variable "ebs_var_lib_volume_type" {
  default = "gp2"
  type    = "string"

  description = <<-EOF
    EBS volume type for the /var/lib filesystem.
  EOF
}

variable "ec2_instance_type" {
  default = "m4.4xlarge"
  type    = "string"

  description = <<-EOF
    The instance type to launch in the auto-scaling group.
  EOF
}

variable "ec2_key_name" {
  default = "isre-shared"
  type    = "string"

  description = <<-EOF
    EC2 SSH Key Name
  EOF
}

variable "hub_cidr_block" {
  default = "10.10.0.0/16"
  type    = "string"

  description = <<-EOF
    CIDR block for the Atlas Hub.
  EOF
}

variable "lahq_cidr_block" {
  default = "10.40.0.0/21"
  type    = "string"

  description = <<-EOF
    CIDR block for the LA office.
  EOF
}

variable "layer_dmz_cidr_blocks" {
  type = "list"

  description = <<-EOF
    CIDR blocks for the three DMZ subnets in the Atlas Stack.
  EOF
}

variable "layer_public_cidr_blocks" {
  type = "list"

  description = <<-EOF
    CIDR blocks for the three public subnets in the Atlas Stack.
  EOF
}

variable "layer_public_subnet_ids" {
  type = "list"

  description = <<-EOF
    Subnet ids for the three subnets in the public layer in the Atlas Stack.
  EOF
}

variable "layer_services_cidr_blocks" {
  type = "list"

  description = <<-EOF
    CIDR blocks for the three services subnets in the Atlas Stack.
  EOF
}

variable "project_name_fancy" {
  type = "string"

  description = <<-EOF
    The project fancy name for this Atlas Stack, e.g. DC/OS Public Workers.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    The Route 53 private zone ID for internal DNS records.
  EOF
}

variable "s3_repo_bucket_name" {
  description = <<-EOF
    S3 bucket name of the repo bucket for the Atlas Dev Environment.
  EOF
}

variable "stack_name" {
  description = <<-EOF
    The long environment name for Atlas Stack, e.g. development.
  EOF
}

variable "stack_name_fancy" {
  type = "string"

  description = <<-EOF
    The fancy name for this Atlas Stack.
  EOF
}

variable "stack_name_short" {
  description = <<-EOF
    The short environment name for Atlas Stack, e.g. dev.
  EOF
}

variable "stack_region" {
  type = "string"

  description = <<-EOF
    The region for Atlas Stack.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    The VPC id of the Atlas Stack.
  EOF
}

variable "web_elb_id" {
  description = <<-EOF
    The wildcard/web ELB to attach these workers to.
  EOF
}

variable "zone" {
  description = <<-EOF
    The hosted zone name for the Atlas Stack.
  EOF
}
