# Atlas Development Environment - Code Pipeline Admin - Outputs

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "aws_region" {
  value = "${var.aws_region}"
}

output "exported_modules" {
  value = ["code_pipeline"]
}
