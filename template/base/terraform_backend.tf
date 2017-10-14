# Terraform Backend File - Managed by Automation

terraform {
  backend "s3" {
    region="us-east-1"
    acl="bucket-owner-full-control"
  }
}

provider "template" {
  version = "~> 0.1"
}

provider "terraform" {
  version = "~> 1.0"
}
