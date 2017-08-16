# Codis Proxy Module - Outputs

output "dns_name" {
  value = "${aws_route53_record.pool.fqdn}"
}
