# Atlas Production 2.0 Account - Variables

variable "aws_account_id" {
  description = <<-EOF
    The allowed AWS account ID that this Atlas Project is to run in. (Should always be the Grindr 2.0 account).
  EOF
}

variable "aws_region" {
  description = <<-EOF
    The region this project runs in.
  EOF
}

variable "name_short" {
  description = <<-EOF
    A short, slugified account name.
  EOF
}
