# Atlas Development Environment - Data-Science Kafka Load Test Resources - Outputs

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "exported_modules" {
  value = [
    "kafka",
    "atlas_service"
  ]
}
