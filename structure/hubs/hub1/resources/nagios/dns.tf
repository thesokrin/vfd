# Atlas Hub - Nagios Resources - DNS

resource "aws_route53_record" "default" {
  name = "nagios"
  type = "A"
  ttl = 300
  zone_id = "${var.private_zone_id}"
  records = ["${aws_instance.default.private_ip}"]
}

resource "aws_route53_record" "reverse" {
  name = "${format("%s.%s.%s.10.in-addr.arpa",
    element(split(".", aws_instance.default.private_ip), 3),
    element(split(".", aws_instance.default.private_ip), 2),
    element(split(".", aws_instance.default.private_ip), 1)
  )}"
  type = "PTR"
  ttl = 300
  zone_id = "${var.reverse_zone_id}"

  records = ["${aws_route53_record.default.fqdn}"]
}
