# Atlas Data-Science Environment - Public Load-Balancing Resources

provider "aws" {
  # can only be run in us-east-1 under the grindr 3.0 account
  region              = "${var.aws_region}"
  allowed_account_ids = ["${var.aws_account_id}"]
}
