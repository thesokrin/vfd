# Atlas Development Environment - Mesos Public Workers - Variables

variable "asg_capacity" {
  description = <<-EOF
    Number of servers to keep active in the auto-scaling group.
  EOF
}

variable "chat_sieve_elb_ids" {
  type = "list"
  description = <<-EOF
    List of ELB ids for the chat sieve load balancers.
  EOF
}

variable "coreos_ami_id" {
  description = <<-EOF
    AMI ID of the Core OS AMI in the us-east-1 region to use in the auto-scaling group.
  EOF
}

variable "dcos_bootstrap_id" {
  description = <<-EOF
    A secret hash that DC/OS uses to prevent their customers from using their open source edition.
  EOF
}

variable "dynamic_port_start" {
  description = <<-EOF
    Start of the dynamic port range for Marathon LB.
  EOF
}

variable "dynamic_port_end" {
  description = <<-EOF
    End of the dynamic port range for Marathon LB.
  EOF
}

variable "ebs_root_volume_size" {
  description = <<-EOF
    EBS volume size in gigabytes for the root filesystem.
  EOF
}

variable "ebs_root_volume_type" {
  description = <<-EOF
    EBS volume type for the root filesystem.
  EOF
}

variable "ebs_var_lib_volume_size" {
  description = <<-EOF
    EBS volume size for the /var/lib filesystem.
  EOF
}

variable "ebs_var_lib_volume_type" {
  description = <<-EOF
    EBS volume type for the /var/lib filesystem.
  EOF
}

variable "ec2_instance_type" {
  description = <<-EOF
    The instance type to launch in the auto-scaling group.
  EOF
}

variable "env_cidr_block" {
  description = <<-EOF
    The CIDR block for the Atlas dev environment.
  EOF
}

variable "env_name" {
  description = <<-EOF
    The long environment name, e.g. development.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    The short environment name, e.g. dev.
  EOF
}

variable "hub_cidr_block" {
  description = <<-EOF
    CIDR block for the Atlas Hub.
  EOF
}

variable "lahq_cidr_block" {
  description = <<-EOF
    CIDR block for the LA office.
  EOF
}

variable "layer_dmz_cidr_blocks" {
  type = "list"
  description = <<-EOF
    CIDR blocks for the three DMZ subnets in the Atlas dev environment.
  EOF
}

variable "layer_public_cidr_blocks" {
  type = "list"
  description = <<-EOF
    CIDR blocks for the three public subnets in the Atlas dev environment.
  EOF
}

variable "layer_public_subnet_ids" {
  type = "list"
  description = <<-EOF
    Subnet ids for the three subnets in the public layer in the Atlas dev environment.
  EOF
}

variable "layer_services_cidr_blocks" {
  type = "list"
  description = <<-EOF
    CIDR blocks for the three services subnets in the Atlas dev environment.
  EOF
}

variable "mesos_worker_role" {
  description = <<-EOF
    IAM Role name for the Mesos Workers.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    The Route 53 private zone ID for internal DNS records.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    The VPC id of the Atlas dev environment.
  EOF
}

variable "web_elb_id" {
  description = <<-EOF
    The wildcard/web ELB to attach these workers to.
  EOF
}

variable "zone" {
  description = <<-EOF
    The hosted zone name for the Atlas dev environment.
  EOF
}
