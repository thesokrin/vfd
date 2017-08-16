# Atlas Elasticsearch Module - Outputs

output "dns" {
  value = "${aws_route53_record.loadbalancer.fqdn}"
}

output "exported_modules" {
  value = []
}
