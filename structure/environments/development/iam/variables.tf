# Atlas Development Environment - Tier 2 IAM Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    AWS account ID of the Atlas Development Environment (preprod).
  EOF
}

variable "aws_account_staging" {
  description = <<-EOF
    AWS account id of the Grindr staging account.
  EOF
}

variable "aws_account_preprod" {
  description = <<-EOF
    AWS account id of the Grindr pre-prod account.
  EOF
}

variable "aws_account_2_0" {
  description = <<-EOF
    AWS account id of the Grindr 2.0 account.
  EOF
}

variable "aws_account_3_0" {
  description = <<-EOF
    AWS account id of the Grindr 3.0 account.
  EOF
}

variable "aws_accounts" {
  type = "list"
  description = <<-EOF
    AWS account ids for all four Grindr accounts.
  EOF
}

variable "s3_registry_bucket_name" {
  description = <<-EOF
    S3 bucket name of the registry bucket for the Atlas Dev Environment.
  EOF
}
