# Atlas S3 Resources - APT Bucket Resources - Variables

variable "aws_account_id" {
  description = <<-EOF
    The AWS account ID that these resources live in (2.0).
  EOF
}

variable "aws_accounts" {
  type = "map"

  description = <<-EOF
    A mapping of short names to AWS account ids.
  EOF
}

variable "aws_region" {
  description = <<-EOF
    The region this project runs in.
  EOF
}

variable "logging_bucket" {
  description = <<-EOF
    Bucket to log access and modifications to for this bucket.
  EOF
}

variable "logging_bucket_prefix" {
  description = <<-EOF
    The prefix in the logging bucket to append logs for the isre.grindr.io bucket.
  EOF
}

variable "vpc_endpoint_ids" {
  type = "map"

  description = <<-EOF
    A mapping of vpce values to account hosting vpc.
  EOF
}
