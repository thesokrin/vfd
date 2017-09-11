# Atlas Hub - Logstash Resources

provider "aws" {
  # only allowed in us-east-1
  region = "us-east-1"

  # only allowed in one fixed AWS account
  allowed_account_ids = ["${var.aws_account_id}"]
}
