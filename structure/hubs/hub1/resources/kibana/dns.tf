# Atlas Hub 1 - Kibana Resources - DNS

resource "aws_route53_record" "default" {
  name = "kibana"
  zone_id = "${var.private_zone_id}"
  type = "A"

  alias {
    name = "${aws_elb.default.dns_name}"
    zone_id = "${aws_elb.default.zone_id}"
    evaluate_target_health = true
  }
}
