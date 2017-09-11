# Atlas Preprod Account - Autospotting Resources - Output

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "exported_modules" {
  value = ["autospotting"]
}

output "name" {
  value = "${var.name}"
}
