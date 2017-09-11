# Atlas Staging Account - IAM Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    ID of the AWS staging account.
  EOF
}

variable "aws_region" {
  description = <<-EOF
    The AWS region to operate in.
  EOF
}
