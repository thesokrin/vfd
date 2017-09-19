# Atlas Staging Environment - Collect Resources - Outputs

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "exported_modules" {
  value = ["collect"]
}
