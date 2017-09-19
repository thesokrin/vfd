# Atlas Development - MonkeyIsland Resources - Outputs

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "exported_modules" {
  value = ["monkey_island", "atlas_static_service"]
}