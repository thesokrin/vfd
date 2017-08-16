# Chat Presence Module - DNS Resources

resource "aws_route53_record" "elb_direct" {
  name = "presence-direct"
  type = "A"
  zone_id = "${var.public_zone_id}"

  alias {
    name = "${aws_elb.direct.dns_name}"
    zone_id = "${aws_elb.direct.zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "pool_private" {
  name = "presence-pool"
  type = "A"
  ttl = "5"
  zone_id = "${var.private_zone_id}"
  records = ["${aws_instance.default.*.private_ip}"]
}

resource "aws_route53_record" "srv" {
  name = "presence"
  type = "SRV"
  ttl = 60
  zone_id = "${var.private_zone_id}"
  records = ["${formatlist("0 100 4000 %s", aws_route53_record.private.*.fqdn)}"]
}

resource "aws_route53_record" "auth_srv" {
  name = "presence-auth"
  type = "SRV"
  ttl  = 300
  zone_id = "${var.private_zone_id}"
  records = ["0 100 ${var.presence_auth_port} ${var.presence_auth_host}"]
}

resource "aws_route53_record" "private" {
  count = 3

  name = "presence-${count.index + 1}"
  type = "A"
  ttl = "5"
  zone_id = "${var.private_zone_id}"
  records = ["${element(aws_instance.default.*.private_ip, count.index)}"]
}

resource "aws_route53_record" "reverse" {
  count = 3

  name = "${format("%s.%s.%s.10.in-addr.arpa",
    element(split(".", element(aws_instance.default.*.private_ip, count.index)), 3),
    element(split(".", element(aws_instance.default.*.private_ip, count.index)), 2),
    element(split(".", element(aws_instance.default.*.private_ip, count.index)), 1)
  )}"
  type = "PTR"
  ttl = "5"
  zone_id = "${var.reverse_zone_id}"
  records = ["presence-${count.index + 1}.${var.zone}"]
}
