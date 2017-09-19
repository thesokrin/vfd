# Production 2.0 Account - S3 Resources

provider "aws" {
  region = "us-east-1"
  allowed_account_ids = ["${var.aws_account_id}"]
}
