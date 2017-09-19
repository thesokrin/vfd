# Atlas Hub - Data Retention Resources - Outputs

output "exported_modules" {
  value = ["service"]
}

output "user" {
  value = "${aws_iam_user.data_retention.name}"
}

output "group" {
  value = "${aws_iam_group.data_retention.name}"
}
