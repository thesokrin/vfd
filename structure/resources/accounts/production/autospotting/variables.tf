# Atlas Production 3.0 Account - Autospotting Resource

variable "aws_account_id" {
  description = <<-EOF
    AWS account id of the Atlas Production 3.0 Account.
  EOF
}

variable "name" {
  default = "autospotting"
  description = <<-EOF
    Name that will used to derive our hostnames.
  EOF
}

# Autospotting configuration
variable "autospotting_min_on_demand_percentage" {
  description = <<-EOF
    Minimum on-demand instances to keep in percentage
  EOF
}
