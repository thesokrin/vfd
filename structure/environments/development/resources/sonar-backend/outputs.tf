# Atlas PreProd - Lyfecycle Sonar Resources - Outputs

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "exported_modules" {
  value = ["atlas_static_service"]
}