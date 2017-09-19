# Atlas S3 Resources - ISRE Bucket Resources - Variables

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
