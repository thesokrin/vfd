# Atlas Development Environment - Mesos Masters DNS Resources

resource "aws_route53_record" "default" {
  count = 3

  zone_id = "${var.private_zone_id}"
  name = "mesos-master-${count.index + 1}"
  type = "A"
  ttl = 5
  records = ["${element(aws_instance.default.*.private_ip, count.index)}"]
}

resource "aws_route53_record" "zookeeper" {
  count = 3

  zone_id = "${var.private_zone_id}"
  name = "zookeeper-${count.index + 1}"
  type = "CNAME"
  ttl = 5
  records = ["mesos-master-${count.index + 1}.${var.zone}"]
}

resource "aws_route53_record" "zookeeper_pool" {
  zone_id = "${var.private_zone_id}"
  name = "zookeeper"
  type = "A"
  ttl = 5
  records = ["${aws_instance.default.*.private_ip}"]
}

resource "aws_route53_record" "reverse" {
  count = 3

  zone_id = "${var.reverse_zone_id}"
  name = "${
    format("%s.%s.%s.10.in-addr.arpa",
      element(split(".", element(aws_instance.default.*.private_ip, count.index)), 3),
      element(split(".", element(aws_instance.default.*.private_ip, count.index)), 2),
      var.env_id
    )
  }"
  type = "PTR"
  ttl = "5"
  records = ["mesos-master-${count.index + 1}"]
}

resource "aws_route53_record" "loadbalancer" {
  zone_id = "${var.private_zone_id}"
  name = "mesos-master"
  type = "A"

  alias {
    name = "${aws_elb.default.dns_name}"
    zone_id = "${aws_elb.default.zone_id}"
    evaluate_target_health = true
  }
}
