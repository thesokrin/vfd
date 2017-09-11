# Atlas Development Environment - Load Balancing Resources

provider "aws" {
  # only allowed in us-east-1
  region = "us-east-1"
  # only allowed in preprod
  allowed_account_ids = ["${var.aws_account_id}"]
}
