# Atlas Manager Module - DNS

resource "aws_route53_record" "manager_internal" {
  zone_id = "${var.private_zone_id}"
  name    = "manager"
  type    = "A"
  ttl     = "5"
  records = ["${aws_instance.manager.private_ip}"]
}

resource "aws_route53_record" "manager_internal_reverse" {
  # reverse record
  zone_id = "${var.reverse_zone_id}"
  name    = "${format("%s.%s.%s.10.in-addr.arpa",
    element(split(".", aws_instance.manager.private_ip), 3),
    element(split(".", aws_instance.manager.private_ip), 2),
    element(split(".", aws_instance.manager.private_ip), 1)
  )}"
  type    = "PTR"
  ttl     = "5"
  records = ["manager.${var.zone}"]
}

resource "aws_route53_record" "manager_external" {
  zone_id = "${var.public_zone_id}"
  name    = "manager"
  type    = "A"
  ttl     = "5"
  records = ["${aws_eip.manager.public_ip}"]
}

resource "aws_route53_record" "spinaltap" {
  zone_id = "${var.public_zone_id}"
  name    = "spinaltap"
  type    = "A"
  ttl     = "5"
  records = ["${aws_eip.manager.public_ip}"]
}
