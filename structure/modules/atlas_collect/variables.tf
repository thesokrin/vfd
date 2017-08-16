# Atlas Collect Module - Variables

variable "additional_collect_ingress_cidr_blocks" {
  type = "list"
  default = ["127.0.0.1/32"]
  description = <<-EOF
    Additional CIDR blocks to allow access to the given collect resources.

    This parameter only needs to be set on the Atlas Hub collect module, as it allows ingress from all of the other
    environments in addition to internal traffic.
  EOF
}

variable "ami_id" {
  default = "ami-9c9d3b8a"
  description = <<-EOF
    The latest atlas-trusty stable AMI in us-east-1.
  EOF
}

variable "cidr_block" {
  description = <<-EOF
    CIDR block for the Atlas Stack in which this module is deployed.
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
    An IAM role object to attach to the IAM instance profile of the collect host.
  EOF
}

variable "ec2_instance_type" {
  default = "m4.large"
  description = <<-EOF
    EC2 instance type for the collect instances.
  EOF
}

variable "ec2_key_name" {
  default = "isre-shared"
  description = <<-EOF
    Default key-pair for the emergency access user.
  EOF
}

variable "layer_admin_subnet_ids" {
  type = "list"
  description = <<-EOF
    List of three subnet ids for the admin layer for this Atlas Stack.
  EOF
}

variable "logs_destination" {
  description = <<-EOF
    The forwarding destination of logs collected in this collect module.

    Atlas Environments will forward to the Atlas Hub, the Atlas Hub will forward to its internal Logstash cluster.
  EOF
}

variable "metrics_destination" {
  description = <<-EOF
    The forwarding destination of metrics collected in this collect module.

    Atlas Environments will forward to the Atlas Hub, the Atlas Hub will forward to its internal metrics cluster.
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

variable "stack_name" {
  description = <<-EOF
    The long, slugified name of this Atlas Stack.
  EOF
}

variable "stack_name_short" {
  description = <<-EOF
    The short, slugified three or four character name of this Atlas Stack.
  EOF
}

variable "stack_name_fancy" {
  description = <<-EOF
    The fancy name for this Atlas Stack.
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
