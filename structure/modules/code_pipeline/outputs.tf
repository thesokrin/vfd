# Code Pipeline Module - Outputs

output "bucket" {
  value = "${aws_s3_bucket.default.bucket}"
}

output "expected_deploy_file" {
  value = "${var.expected_deploy_file}"
}

output "storage_iam_user" {
  value = "${aws_iam_user.storage_manager.name}"
}

output "storage_iam_group" {
  value = "${aws_iam_group.storage_group.name}"
}

output "code_pipeline_iam_role" {
  value = "${aws_iam_role.code_pipeline_role.name}"
}
