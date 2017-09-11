# Atlas Production 2.0 Account - Autospotting Resource - Outputs

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "exported_modules" {
  value = ["autospotting"]
}

output "name" {
  value = "${var.name}"
}
