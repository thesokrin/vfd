# Atlas Staging Account - Shared Key Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    AWS Account ID for the staging account.
  EOF
}

variable "aws_region" {
  description = <<-EOF
    Region to use.
  EOF
}
