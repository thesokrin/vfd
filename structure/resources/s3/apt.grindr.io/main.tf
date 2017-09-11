# Atlas S3 Resources - APT Bucket Resources

provider "aws" {
  # only allowed in us-east-1
  region = "${var.aws_region}"

  # only allowed in 2.0
  allowed_account_ids = ["${var.aws_account_id}"]
}
