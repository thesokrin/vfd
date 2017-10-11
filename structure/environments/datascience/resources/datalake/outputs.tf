# Atlas Data-Science Environment - Datalake Resources - Outputs

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "aws_region" {
  value = "${var.aws_region}"
}

output "bucket_name" {
  value = "${aws_s3_bucket.default.bucket}"
}

output "iam_user" {
  value = "${aws_iam_user.default.name}"
}

output "iam_group" {
  value = "${aws_iam_group.default.name}"
}
