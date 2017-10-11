# Atlas Data-Science Environment - Public Load-Balancing Resources - DNS

# dashboard DNS name
resource "aws_route53_record" "dash" {
  name    = "dash"
  zone_id = "${var.public_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_elb.dash.dns_name}"
    zone_id                = "${aws_elb.dash.zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "web" {
  name    = "*"
  zone_id = "${var.public_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_elb.web.dns_name}"
    zone_id                = "${aws_elb.web.zone_id}"
    evaluate_target_health = true
  }
}
