# Atlas Manager Module - Variables

variable "ami_id" {
  default = "ami-9c9d3b8a"
  description = <<-EOF
    The latest atlas-trusty stable AMI in us-east-1.
  EOF
}

variable "ec2_iam_role" {
  default = "atlas_ec2_assume_role"
  description = <<-EOF
    An IAM role object to attach to the IAM instance profile of the manager host.
  EOF
}

variable "ec2_instance_type" {
  default = "m4.large"
  description = <<-EOF
    EC2 instance type for the manager host.
  EOF
}

variable "ec2_key_name" {
  default = "isre-shared"
  description = <<-EOF
    Default key-pair for the emergency access user.
  EOF
}

variable "layer_dmz_cidr_blocks" {
  type = "list"
  description = <<-EOF
    List of three DMZ CIDR blocks in the given Atlas Stack.
  EOF
}

variable "layer_dmz_subnet_ids" {
  type = "list"
  description = <<-EOF
    List of three DMZ subnet IDs in the given Atlas Stack.
  EOF
}

variable "ebs_root_volume_type" {
  default = "gp2"
  description = <<-EOF
    EBS root volume type for the manager host.
  EOF
}

variable "ebs_root_volume_size" {
  default = 32
  description = <<-EOF
    EBS root volume size for the manager host.
  EOF
}

variable "stack_name" {
  description = <<-EOF
    Long name of the Atlas Stack in which this manager host is being launched.
  EOF
}

variable "stack_name_short" {
  description = <<-EOF
    Short name of the Atlas Stack in which this manager host is being launched.
  EOF
}

variable "stack_name_fancy" {
  description = <<-EOF
    Capitalized fancy name of the Atlas Stack in which this manager host is being launched.

    Example: "Atlas Production Environment".
  EOF
}

variable "public_zone_id" {
  description = <<-EOF
    Hosted zone id of the public zone of the Atlas Stack in which this manager host is being launched.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    Hosted zone id of the private zone of the Atlas Stack in which this manager host is being launched.
  EOF
}

variable "reverse_zone_id" {
  description = <<-EOF
    Hosted zone id of the reverse zone of the Atlas Stack in which this manager host is being launched.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    VPC ID of the Atlas Stack where this manager host is being launched.
  EOF
}

variable "zone" {
  description = <<-EOF
    Hosted zone name.
  EOF
}
