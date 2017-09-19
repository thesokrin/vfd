# Atlas Production 3.0 Account - IAM Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    ID of the AWS production 3.0 account.
  EOF
}

variable "aws_region" {
  description = <<-EOF
    The AWS region to operate in.
  EOF
}
