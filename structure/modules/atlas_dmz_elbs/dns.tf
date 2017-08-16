# Atlas DMZ Load Balancers Module - DNS

resource "aws_route53_record" "web" {
  name = "*"
  type = "A"
  zone_id = "${var.public_zone_id}"

  alias {
    name = "${aws_elb.web.dns_name}"
    zone_id = "${aws_elb.web.zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "realtime" {
  name = "rt"
  type = "A"
  zone_id = "${var.public_zone_id}"

  alias {
    name = "${aws_elb.realtime.dns_name}"
    zone_id = "${aws_elb.realtime.zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "realtime_cname" {
  name = "realtime"
  type = "CNAME"
  ttl = 300
  zone_id = "${var.public_zone_id}"

  records = ["${aws_route53_record.realtime.fqdn}"]
}
