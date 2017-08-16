# Atlas Redis Cluster Shard Module - Outputs

output "primary_dns" {
  value = "${aws_route53_record.primary_private.fqdn}"
}

output "primary_ip" {
  value = "${aws_instance.primary.private_ip}"
}

output "replica_pool_dns_name" {
  value = "${aws_route53_record.replica_pool_private.fqdn}"
}

output "replica_ips" {
  value = ["${aws_instance.replica.*.private_ip}"]
}

output "replica_dns_names" {
  value = ["${aws_route53_record.replica_private.*.fqdn}"]
}
