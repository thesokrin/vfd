# Atlas Elasticsearch Module - DNS Resources

resource "aws_route53_record" "loadbalancer" {
  name = "${var.name}"
  type = "A"
  zone_id = "${var.private_zone_id}"

  alias {
    name = "${aws_elb.default.dns_name}"
    zone_id = "${aws_elb.default.zone_id}"
    evaluate_target_health = true
  }
}