# Atlas $_ENVIRONMENT Environment - $_FANCY_NAME

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "exported_modules" {
  value = [
    "$_NAME",
    "atlas_service"
  ]
}
