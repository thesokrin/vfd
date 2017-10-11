# Atlas Production - GoCD Resources - Outputs

output "exported_modules" {
  value = ["service"]
}

output "role_arn" {
  value = "${aws_iam_role.master.arn}"
}
