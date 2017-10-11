# Atlas Preprod Account - IAM Resources - Variables

variable "aws_region" {
  description = <<-EOF
    The AWS region to execute Terraform in.
  EOF
}

variable "aws_account_id" {
  description = <<-EOF
    The AWS account ID of the preprod account.
  EOF
}
