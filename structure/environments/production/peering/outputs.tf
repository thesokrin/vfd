# Atlas Production Environment - VPC Peering Resources - Outputs

output "dsci_peering_connection_id" {
  value = "${aws_vpc_peering_connection.datascience.id}"
}

output "oldprod_peering_connection_id" {
  value = "${aws_vpc_peering_connection.old_production.id}"
}
