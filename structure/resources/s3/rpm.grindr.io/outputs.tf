# Atlas S3 Resources - RPM Bucket Resources - Outputs

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "bucket" {
  value = "${aws_s3_bucket.default.bucket}"
}
