# Atlas Staging Environment - Artemis Resources - Outputs

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "aws_region" {
  value = "${var.aws_region}"
}

output "security_group_id" {
  value = "${module.artemis.security_group_id}"
}
output "exported_modules" {
  value = ["artemis"]
}
