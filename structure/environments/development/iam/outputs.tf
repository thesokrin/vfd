# Atlas Development Environment - Tier 2 IAM Resources - Outputs

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "exported_modules" {
  value = []
}

output "profile_default_name" {
  value = "${aws_iam_instance_profile.default.name}"
}

output "profile_default_arn" {
  value = "${aws_iam_instance_profile.default.arn}"
}

output "mesos_worker_role_name" {
  value = "${aws_iam_role.mesos_worker.name}"
}
