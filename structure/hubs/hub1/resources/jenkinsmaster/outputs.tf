# Atlas hub Environment - Jenkins Master

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "exported_modules" {
  value = [
    "jenkinsmaster",
    "atlas_service"
  ]
}
