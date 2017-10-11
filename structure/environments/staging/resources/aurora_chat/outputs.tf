# Atlas Staging Environment - Chat Aurora Cluster Resources - Outputs

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "exported_modules" {
  value = ["aurora_chat"]
}
