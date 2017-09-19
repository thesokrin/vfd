# Atlas Data-Science Environment - Redshift Cluster Resources

provider "aws" {
  # only allowed in us-east-1
  region = "${var.aws_region}"

  # only allowed in one fixed AWS account
  allowed_account_ids = ["${var.aws_account_id}"]
}
