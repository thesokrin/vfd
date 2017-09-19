# Atlas Hub - Nagios Resources - Outputs

output "fqdn" {
  value = "${aws_route53_record.default.fqdn}"
}
