# Atlas Production Environment - Artemis Resources - Variables

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
