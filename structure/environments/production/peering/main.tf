# Atlas Production Environment - VPC Peering Resources

provider "aws" {
  # only allowed in us-east-1
  region = "us-east-1"
  # only allowed in 3.0
  allowed_account_ids = ["${var.aws_account_id}"]
}
