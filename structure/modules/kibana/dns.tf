# Atlas Kibana Module - DNS Resources

resource "aws_route53_record" "private" {
  count = "${var.ec2_instance_count}"

  name    = "${var.name}-kibana-${count.index + 1}"
  type    = "A"
  ttl     = "5"
  zone_id = "${data.terraform_remote_state.environment.private_zone_id}"

  records = ["${element(aws_instance.default.*.private_ip, count.index)}"]
}

resource "aws_route53_record" "reverse" {
  count = "${var.ec2_instance_count}"

  name = "${format("%s.%s.%s.10.in-addr.arpa",
    element(split(".", element(aws_instance.default.*.private_ip, count.index)), 3),
    element(split(".", element(aws_instance.default.*.private_ip, count.index)), 2),
    element(split(".", element(aws_instance.default.*.private_ip, count.index)), 1)
  )}"

  type    = "PTR"
  ttl     = "5"
  zone_id = "${data.terraform_remote_state.environment.reverse_zone_id}"

  records = ["${element(aws_route53_record.private.*.fqdn, count.index)}"]
}

resource "aws_route53_record" "pool" {
  count = "${var.ec2_instance_count > 1 ? 1 : 0}"

  name    = "${var.name}-kibana-pool"
  type    = "A"
  ttl     = "5"
  zone_id = "${data.terraform_remote_state.environment.private_zone_id}"

  records = ["${aws_instance.default.*.private_ip}"]
}

resource "aws_route53_record" "loadbalancer" {
  name    = "${var.name}-kibana"
  type    = "A"
  zone_id = "${data.terraform_remote_state.environment.private_zone_id}"

  alias {
    name                   = "${aws_elb.default.dns_name}"
    zone_id                = "${aws_elb.default.zone_id}"
    evaluate_target_health = true
  }
}
