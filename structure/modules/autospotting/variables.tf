# Atlas Autospotting Module - Variables
variable "name" {
  default = "autospotting"
  description = <<-EOF
    Name of the instance of the instantiated module in the given Atlas Environment.
  EOF
}

# Autospotting configurations
variable "autospotting_min_on_demand_number" {
  default = "0"

  description = <<-EOF
    Minimum on-demand instances to keep in absolute value
  EOF
}

variable "autospotting_min_on_demand_percentage" {
 default = "50.0"

  description = <<-EOF
    Minimum on-demand instances to keep in percentage
  EOF
}

variable "autospotting_regions_enabled" {
  default = "us-east-1"

  description = <<-EOF
    Regions that autospotting is watching
  EOF
}

variable "lambda_timeout" {
  default = "300"

  description = <<-EOF
    Timeout after which the Lambda function is terminated.
  EOF
}

variable "lambda_run_frequency" {
  default = "rate(5 minutes)"

  description = <<-EOF
    How frequent should lambda run
  EOF
}
