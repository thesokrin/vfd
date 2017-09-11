# Atlas Production 3.0 Account - Shared Key Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    AWS Account ID for the production 3.0 account.
  EOF
}

variable "aws_region" {
  description = <<-EOF
    Region to use.
  EOF
}
