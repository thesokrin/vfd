# Atlas Artemis Module - Outputs

output "security_group_id" {
  value = "${aws_security_group.default.id}"
}

output "elb_name" {
  value = "${aws_elb.default.name}"
}

output "elb_dns" {
  value = "${aws_route53_record.internal_elb.fqdn}"
}
