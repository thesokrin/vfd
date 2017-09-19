# Atlas Production - GoCD Resources - Variables
variable "aws_region" {
  description = <<-EOF
    The AWS region of the Atlas Development Environment.
  EOF
}

variable "atlas_environment" {
  description = <<-EOF
    The full Atlas Environment name for the Atlas Production (prod-3.0).
  EOF
}

variable "aws_account_id" {
  description = <<-EOF
    The AWS account id of the Atlas Production.
  EOF
}

variable "ec2_instance_type" {
  description = <<-EOF
    The EC2 instance type to launch.
  EOF
}

variable "project_name" {
  description = <<-EOF
    Atlas Project name.
  EOF
}

variable "project_owner" {
  description = <<-EOF
    Team responsible for billing of these resources.
  EOF
}

variable "gocd_server_ec2_instance_type" {
  description = <<-EOF
    The EC2 instance type to launch.
  EOF
}

variable "gocd_server_ebs_root_volume_size" {
  default = 32

  description = <<-EOF
    The EBS volume size for the root filesystem on instances.
  EOF
}

variable "gocd_server_ebs_root_volume_type" {
  default = "gp2"

  description = <<-EOF
    The EBS root volume type for the root filesystem on instances.
  EOF
}

variable "gocd_server_ec2_iam_role" {
  default = "atlas_ec2_assume_role"

  description = <<-EOF
    An IAM role object to attach to the IAM instance profile of the static_service host.
  EOF
}

variable "gocd_server_ec2_key_name" {
  default = "isre-shared"

  description = <<-EOF
    EC2 SSH Key Name
  EOF
}

variable "gocd_server_role_package" {
  default = "grindr-role-base"

  description = <<-EOF
    The role that will be launched via cloud init.
  EOF
}

variable "gocd_server_name" {
  description = <<-EOF
    Name that will used to derive our hostname for the gocd server.
  EOF
}

variable "gocd_server_ami_id" {
  default = "ami-9c9d3b8a"

  description = <<-EOF
    The latest atlas-trusty stable AMI in us-east-1.
  EOF
}

variable "gocd_server_agent_port" {
  default = 5143

  description = <<-EOF
    Security group port to open up for agents to connect.
  EOF
}
