# Atlas Tier 1 IAM Resources

provider "aws" {
  # only allowed in us-east-1
  region = "us-east-1"

  # resources created in all accounts, please propagate to all 4 accounts
  allowed_account_ids = ["${keys(var.aws_accounts)}"]
}

data "aws_caller_identity" "current" {}
