# Atlas Hub - VPC Peering Resources - Outputs

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "aws_region" {
  value = "${var.aws_region}"
}

output "exported_modules" {
  value = []
}

output "vpc_peering_connection_ids" {
  value = "${var.vpc_peering_connections}"
}
