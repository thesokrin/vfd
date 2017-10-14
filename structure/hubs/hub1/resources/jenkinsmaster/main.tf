# Atlas hub Environment - Jenkins Master

provider "aws" {
  region = "${var.aws_region}"

  # only allowed in one fixed AWS account
  allowed_account_ids = ["${var.aws_account_id}"]
}
