# Atlas Preprod Account - IAM Resources - Outputs

output "aws_region" {
  value = "${var.aws_region}"
}

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "exported_modules" {
  value = ["global"]
}
