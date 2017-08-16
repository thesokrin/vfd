# CDN Module - Outputs

output "bucket" {
  value = "${aws_s3_bucket.default.bucket}"
}

output "iam_user" {
  value = "${aws_iam_user.default.name}"
}

output "iam_group" {
  value = "${aws_iam_group.default.name}"
}
