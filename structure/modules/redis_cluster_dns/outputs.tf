# Atlas Redis Cluster DNS Module - Outputs

output "name" {
  value = "${var.name}"
}

output "read_dns" {
  value = "${aws_route53_record.replica_pool.fqdn}"
}

output "write_dns" {
  value = "${aws_route53_record.primary_pool.fqdn}"
}

output "zone" {
  value = "${var.zone}"
}
