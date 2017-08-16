# Atlas Service Module - DNS

resource "aws_route53_record" "internal_elb" {
  name    = "${var.name}"
  type    = "A"
  zone_id = "${var.private_zone_id}"

  alias {
    name    = "${aws_elb.internal_elb.dns_name}"
    zone_id = "${aws_elb.internal_elb.zone_id}"

    evaluate_target_health = true
  }
}
