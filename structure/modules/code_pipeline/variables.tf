# Code Pipeline Module - Variables

variable "name" {
  description = <<-EOF
    The name of the project that needs a CDN entry to an S3 bucket.
  EOF
}

variable "env_name" {
  description = <<-EOF
    The long Atlas Environment name.
  EOF
}

variable "project_name" {
  default = "storage"
  description = <<-EOF
    The Atlas Project name for these resources.
  EOF
}

variable "project_owner" {
  default = "isre"
  description = <<-EOF
    The team responsible for the billing of these resources.
  EOF
}

variable "zone" {
  description = <<-EOF
    The zone name of the given Atlas Environment.
  EOF
}

variable "lifecycle_rule_prefix" {
  default = ""

  description = <<-EOF
    Object key prefix identifying one or more objects to which the rule applies.
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

variable "expected_deploy_file" {
  default = "deploy.war"

  description = <<-EOF
    This is the expected name of the deployable artifact to an elastic beanstalk
  EOF
}
