# Atlas DC/OS Masters Module - DNS

resource "aws_route53_record" "default" {
  count = 3

  name    = "dcos-master-${count.index + 1}"
  records = ["${element(aws_instance.default.*.private_ip, count.index)}"]
  ttl     = 5
  type    = "A"
  zone_id = "${var.private_zone_id}"
}

resource "aws_route53_record" "zookeeper" {
  count = 3

  name    = "zookeeper-${count.index + 1}"
  records = ["dcos-master-${count.index + 1}.${var.zone}"]
  ttl     = 5
  type    = "CNAME"
  zone_id = "${var.private_zone_id}"
}

resource "aws_route53_record" "zookeeper_pool" {
  name    = "zookeeper"
  records = ["${aws_instance.default.*.private_ip}"]
  ttl     = 5
  type    = "A"
  zone_id = "${var.private_zone_id}"
}

resource "aws_route53_record" "reverse" {
  count = 3

  name = "${
    format("%s.%s.%s.10.in-addr.arpa",
      element(split(".", element(aws_instance.default.*.private_ip, count.index)), 3),
      element(split(".", element(aws_instance.default.*.private_ip, count.index)), 2),
      var.stack_id
    )
  }"

  records = ["dcos-master-${count.index + 1}"]
  ttl     = "5"
  type    = "PTR"
  zone_id = "${var.reverse_zone_id}"
}

resource "aws_route53_record" "loadbalancer" {
  name    = "dcos-master"
  type    = "A"
  zone_id = "${var.private_zone_id}"

  alias {
    evaluate_target_health = true
    name                   = "${aws_elb.default.dns_name}"
    zone_id                = "${aws_elb.default.zone_id}"
  }
}
