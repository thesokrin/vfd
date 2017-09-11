# Atlas Development Environment - Tier 2 IAM Resources

provider "aws" {
  # only allowed in us-east-1
  region = "us-east-1"
  # resources created only in the preprod account
  allowed_account_ids = ["${var.aws_account_id}"]
}

data "aws_caller_identity" "current" {}
