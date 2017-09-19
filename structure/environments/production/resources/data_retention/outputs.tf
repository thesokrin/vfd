# Atlas Production Environment - Data Retention Resources - Outputs

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "aws_region" {
  value = "${var.aws_region}"
}

output "bucket_name" {
  value = "${aws_s3_bucket.data_retention_s3.bucket}"
}
