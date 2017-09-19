# Atlas Development Environment - Data-Science $_FANCY_NAME Load Test Resources - Outputs

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "exported_modules" {
  value = [
    "$_NAME",
    "atlas_service"
  ]
}
