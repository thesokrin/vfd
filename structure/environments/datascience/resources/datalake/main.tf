# Atlas Data-Science Environment - Datalake Resources

provider "aws" {
  region = "${var.aws_region}"
  # only allowed in 3.0
  allowed_account_ids = ["${var.aws_account_id}"]
}
