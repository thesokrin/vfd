# Atlas S3 Resources - ISRE Bucket Resources

provider "aws" {
  # only allowed in us-east-1
  region = "us-east-1"
  # only allowed in 2.0
  allowed_account_ids = ["${var.aws_account_id}"]
}
