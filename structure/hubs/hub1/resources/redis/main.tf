# Atlas Hub 1 - Redis Resources

provider "aws" {
  # only allowed in us-east-1
  region = "${var.aws_region}"
  # only allowed in one fixed AWS account
  allowed_account_ids = ["${var.aws_account_id}"]
}
