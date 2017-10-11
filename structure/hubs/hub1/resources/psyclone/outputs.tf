# Atlas Hub - Psyclone Resources - Outputs

output "exported_modules" {
  value = ["service"]
}

output "role_arn" {
  value = "${aws_iam_role.default.arn}"
}
