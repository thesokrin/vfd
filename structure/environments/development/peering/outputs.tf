# Atlas Development Environment - Peering Resources - Outputs

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "peering_connection_id" {
  value = "${aws_vpc_peering_connection.preprod.id}"
}
