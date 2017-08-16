# Chat Presence Module - Outputs

output "direct_elb_fqdn" {
  value = "${aws_route53_record.elb_direct.fqdn}"
}
