# Atlas Static Services Module - Outputs

output "hosts" {
  value = ["${aws_route53_record.private.*.fqdn}"]
}

output "loadbalancer" {
  value = "${aws_elb.default.dns_name}"
}

output "dns_pool" {
  value = "${aws_route53_record.pool.fqdn}"
}

output "dns_srv" {
  value = "${aws_route53_record.srv.fqdn}"
}

output "dns_loadbalancer" {
  value = "${aws_route53_record.loadbalancer.fqdn}"
}
