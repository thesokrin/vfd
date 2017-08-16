# Atlas Service Module - Outputs

output "elb_name" {
  value = "${aws_elb.internal_elb.name}"
}

output "elb_dns" {
  value = "${aws_route53_record.internal_elb.fqdn}"
}
