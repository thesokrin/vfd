# Atlas DC/OS Masters Module - Variables

variable "coreos_ami_id" {
  default = "ami-4d795c5a"
  type    = "string"

  description = <<-EOF
    CoreOS Stable AMI ID in us-east-1.
  EOF
}

variable "dash_elb_id" {
  type = "string"

  description = <<-EOF
    The ID of the dash.${stack_name_short}.grindr.io load balancer.
  EOF
}

variable "dcos_bootstrap_id" {
  default = "e73ba2b1cd17795e4dcb3d6647d11a29b9c35084"
  type    = "string"

  description = <<-EOF
    A secret hash that DC/OS uses to prevent their customers from using their open source edition.
  EOF
}

variable "ebs_root_volume_size" {
  default = "32"
  type    = "string"

  description = <<-EOF
    Size in gigabytes of the root EBS volume for EC2 instances.
  EOF
}

variable "ebs_root_volume_type" {
  default = "gp2"
  type    = "string"

  description = <<-EOF
    Type of the EBS volume to use for the root volume on the EC2 instances.
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
  default = "m4.xlarge"
  type    = "string"

  description = <<-EOF
    Instance type to use for the masters.
  EOF
}

variable "cidr_block" {
  type = "string"

  description = <<-EOF
    The CIDR block for the Atlas Stack.
  EOF
}

variable "hub_cidr_block" {
  default = "10.10.0.0/16"
  type    = "string"

  description = <<-EOF
    CIDR block for the Atlas Hub.
  EOF
}

variable "ec2_key_name" {
  default = "isre-shared"
  type    = "string"

  description = <<-EOF
    EC2 SSH Key Name
  EOF
}

variable "lahq_cidr_block" {
  default = "10.40.0.0/21"
  type    = "string"

  description = <<-EOF
    CIDR block for the LA office.
  EOF
}

variable "layer_admin_cidr_blocks" {
  type = "list"

  description = <<-EOF
    A list of three CIDR blocks for the admin subnets in the Atlas Stack.
  EOF
}

variable "layer_admin_subnet_ids" {
  type = "list"

  description = <<-EOF
    A list of three subnets, one per availability zone, for the admin layer for this Atlas Stack.
  EOF
}

variable "layer_dmz_cidr_blocks" {
  type = "list"

  description = <<-EOF
    A list of CIDR blocks for the DMZ layer in Atlas Stack.
  EOF
}

variable "layer_public_cidr_blocks" {
  type = "list"

  description = <<-EOF
    A list of three CIDR blocks for the public subnets in the Atlas Stack.
  EOF
}

variable "layer_services_cidr_blocks" {
  type = "list"

  description = <<-EOF
    A list of three CIDR blocks for the services subnets in the Atlas Stack.
  EOF
}

variable "private_zone_id" {
  type = "string"

  description = <<-EOF
    Route53 zone identifier for the private zone for this Atlas Stack.
  EOF
}

variable "reverse_zone_id" {
  type = "string"

  description = <<-EOF
    Route53 zone identifier for the reverse zone for this Atlas Stack.
  EOF
}

variable "stack_id" {
  type = "string"

  description = <<-EOF
    The ID of the Atlas Stack.
  EOF
}

variable "stack_name" {
  type = "string"

  description = <<-EOF
    The long, slugified name of this Atlas Stack.
  EOF
}

variable "stack_name_short" {
  type = "string"

  description = <<-EOF
    The short, slugified three or four character name of this Atlas Stack.
  EOF
}

variable "stack_name_fancy" {
  type = "string"

  description = <<-EOF
    The fancy name for this Atlas Stack.
  EOF
}

variable "stack_region" {
  type = "string"

  description = <<-EOF
    The region for Atlas Stack.
  EOF
}

variable "vpc_id" {
  type = "string"

  description = <<-EOF
    VPC ID of the Atlas Stack this module is being launched in.
  EOF
}

variable "zone" {
  type = "string"

  description = <<-EOF
    Hosted zone of the Atlas Stack this module is being launched in.
  EOF
}
