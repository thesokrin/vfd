# Atlas Service Module - Variables

variable "capacity" {
  default = 3

  description = <<-EOF
    Service instance count to maintain in the auto-scaling group.
  EOF
}

variable "cidr_block" {
  description = <<-EOF
    CIDR block of the target Atlas Environment.
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
    AMI ID in the same region as the VPC for Service instances.
  EOF
}

variable "ec2_instance_type" {
  default = "t2.large"

  description = <<-EOF
    EC2 instance type for Service instances.
  EOF
}

variable "ec2_keypair_name" {
  default = "isre-shared"

  description = <<-EOF
    Name of the EC2 keypair for EC2 instances.
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

variable "elb_instance_port" {
  default = 80

  description = <<-EOF
    The port on the instance to route to
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
    The IAM role to attach to Service instance profiles.
  EOF
}

variable "instances_service_protocol" {
  default = "HTTP"

  description = <<-EOF
    Port to end allowing to instance.
  EOF
}

variable "lahq_cidr_block" {
  description = <<-EOF
    The CIDR block for Grindr LA HQ.
  EOF
}

variable "layer_admin_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three CIDR blocks for subnets in the Atlas Admin Layer.
  EOF
}

variable "layer_public_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three CIDR blocks for subnets in the Atlas Public Layer.
  EOF
}

variable "layer_services_subnet_ids" {
  type = "list"

  description = <<-EOF
    List of three subnet ids for subnets in the Atlas Service Layer.
  EOF
}

variable "layer_services_cidr_blocks" {
  type = "list"

  description = <<-EOF
    List of three subnet ids for subnets in the Atlas Services Layer.
  EOF
}

variable "name" {
  description = <<-EOF
    Name that will used to derive our hostnames.
  EOF
}

variable "private_zone_id" {
  description = <<-EOF
    Hosted zone id for the given Atlas Environment's private hosted zone.
  EOF
}

variable "project_name" {
  description = <<-EOF
    The project name which this module lives in.
  EOF
}

variable "project_name_fancy" {
  default = "Service"

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

variable "role_package" {
  default = "grindr-role-base"

  description = <<-EOF
    The role that will be launched via cloud init.
  EOF
}

variable "sg_elb_from_port" {
  default = 80

  description = <<-EOF
    Port to start allowing to instance.
  EOF
}

variable "sg_elb_protocol" {
  default = "tcp"

  description = <<-EOF
    The protocol. If you select a protocol of "-1" (semantically equivalent to "all", which is not a valid value here),
    you must specify a "from_port" and "to_port" equal to 0. If not icmp, tcp, udp, or "-1" use the protocol number.
  EOF
}

variable "sg_elb_to_port" {
  default = 80

  description = <<-EOF
    Port to end allowing to instance.
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

variable "vpc_id" {
  description = <<-EOF
    VPC ID of the given Atlas Environment.
  EOF
}

variable "zone" {
  description = <<-EOF
    The hosted zone name of this Atlas Environment.
  EOF
}

variable "spot_price" {
  default = ""

  description = <<-EOF
    The maximum bid price for new Spot Instances in the ASG. Setting a value enables Spot Instancing.
  EOF
}
