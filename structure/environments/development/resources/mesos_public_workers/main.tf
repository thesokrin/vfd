# Atlas Development Environment - Mesos Public Workers

provider "aws" {
  # only allowed in us-east-1
  region = "us-east-1"
  # only allowed in preprod
  allowed_account_ids = ["202004573189"]
}

data "aws_region" "current" {
  current = true
}
