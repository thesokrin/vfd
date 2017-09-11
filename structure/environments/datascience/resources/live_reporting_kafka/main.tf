# Atlas Data-Science Environment - Live Reporting With Kafka Resources

provider "aws" {
  region = "${var.aws_region}"

  # only allowed in one fixed AWS account
  allowed_account_ids = ["${var.aws_account_id}"]
}
