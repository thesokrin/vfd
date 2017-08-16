# Atlas Static Services Module - Variables

variable "additional_instance_sg_ids" {
  type    = "list"
  default = []

  description = <<-EOF
    List of additional security groups required provided by implementation.
  EOF
}

variable "ami_id" {
  default = "ami-9c9d3b8a"

  description = <<-EOF
    The latest atlas-trusty stable AMI in us-east-1.
  EOF
}

variable "atlas_environment" {
  description = <<-EOF
    The Atlas Environment's full name in which to launch these resources.
  EOF
}

variable "aws_region" {
  default = "us-east-1"

  description = <<-EOF
    The AWS region which this should be launched in.
  EOF
}

variable "create_elb" {
  default = false

  description = <<-EOF
    Variable to determine if we create elb or not.
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
    An IAM role object to attach to the IAM instance profile of the static_service host.
  EOF
}

variable "ec2_instance_type" {
  default = "t2.large"

  description = <<-EOF
    EC2 instance type for the static_service instances.
  EOF
}

variable "ec2_instance_count" {
  default = "3"

  description = <<-EOF
    Number of EC2 instances for static_service cluster.
  EOF
}

variable "ec2_key_name" {
  default = "isre-shared"

  description = <<-EOF
    EC2 SSH Key Name
  EOF
}

variable "elb_conn_drain_timeout" {
  default = 60

  description = <<-EOF
    The time in seconds to allow for connections to drain.
  EOF
}

variable "elb_healthcheck_target" {
  default = "HTTP:80/"

  description = <<-EOF
  The target of the check. Valid pattern is "${PROTOCOL}:${PORT}${PATH}", where PROTOCOL values are:
    * HTTP, HTTPS - PORT and PATH are required
    * TCP, SSL - PORT is required, PATH is not supported
  EOF
}

variable "elb_healthy_threshold" {
  default = 2

  description = <<-EOF
    The number of checks before the instance is declared healthy.
  EOF
}

variable "elb_idle_timeout" {
  default = 3600

  description = <<-EOF
    The time in seconds that the connection is allowed to be idle.
  EOF
}

variable "elb_instance_protocol" {
  default = "HTTP"

  description = <<-EOF
    The protocol to use to the instance. Valid values are HTTP, HTTPS, TCP, or SSL.
  EOF
}

variable "elb_interval" {
  default = 5

  description = <<-EOF
    The interval between checks.
  EOF
}

variable "elb_timeout" {
  default = 2

  description = <<-EOF
    The length of time before the check times out.
  EOF
}

variable "elb_unhealthy_threshold" {
  default = 2

  description = <<-EOF
    The number of checks before the instance is declared unhealthy.
  EOF
}

variable "elb_instance_port" {
  default = 80

  description = <<-EOF
    The port on the instance to route to
  EOF
}

variable "elb_port" {
  default = 80

  description = <<-EOF
    The port to listen on for the load balancer.
  EOF
}

variable "elb_protocol" {
  default = "HTTP"

  description = <<-EOF
    The protocol to listen on. Valid values are HTTP, HTTPS, TCP, or SSL.
  EOF
}

variable "instances_service_protocol" {
  default = "HTTP"

  description = <<-EOF
    Port to end allowing to instance.
  EOF
}

variable "name" {
  description = <<-EOF
    Name that will used to derive our hostnames.
  EOF
}

variable "project_name" {
  description = <<-EOF
    Name of the project.
  EOF
}

variable "project_owner" {
  default = "isre"

  description = <<-EOF
    Name of responsible party.
  EOF
}

variable "role_package" {
  default = "grindr-role-base"

  description = <<-EOF
    The role that will be launched via cloud init.
  EOF
}

variable "service_port" {
  default = 80

  description = <<-EOF
    The service port.
  EOF
}

variable "sg_elb_protocol" {
  default = "tcp"

  description = <<-EOF
    The protocol. If you select a protocol of "-1" (semantically equivalent to "all", which is not a valid value here),
    you must specify a "from_port" and "to_port" equal to 0. If not icmp, tcp, udp, or "-1" use the protocol number.
  EOF
}

variable "sg_instance_from_port" {
  default = 80

  description = <<-EOF
    Port to start allowing to instance.
  EOF
}

variable "sg_instance_protocol" {
  default = "tcp"

  description = <<-EOF
    The protocol. If you select a protocol of "-1" (semantically equivalent to "all", which is not a valid value here),
    you must specify a "from_port" and "to_port" equal to 0. If not icmp, tcp, udp, or "-1" use the protocol number.
  EOF
}

variable "sg_instance_to_port" {
  default = 80

  description = <<-EOF
    Port to end allowing to instance.
  EOF
}
