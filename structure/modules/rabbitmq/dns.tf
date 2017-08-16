# Atlas RabbitMQ Module - DNS

resource "aws_route53_record" "elb_rabbitmq" {
  name = "rabbitmq-elb"
  type = "A"
  zone_id = "${var.private_zone_id}"

  alias {
    name = "${aws_elb.rabbitmq.dns_name}"
    zone_id = "${aws_elb.rabbitmq.zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "rabbitmq_pool" {
  name = "rabbitmq"
  type = "A"
  ttl = "5"
  zone_id = "${var.private_zone_id}"

  records = ["${aws_instance.rabbitmq.*.private_ip}"]
}

resource "aws_route53_record" "srv" {
  name = "rabbitmq"
  type = "SRV"
  ttl = 60
  zone_id = "${var.private_zone_id}"
  records = ["${formatlist("0 100 5672 %s", aws_route53_record.rabbitmq.*.fqdn)}"]
}

resource "aws_route53_record" "rabbitmq" {
  count = "${var.instance_count}"

  name = "rabbitmq-${count.index + 1}"
  type = "A"
  ttl = "5"
  zone_id = "${var.private_zone_id}"

  records = ["${element(aws_instance.rabbitmq.*.private_ip, count.index)}"]
}

resource "aws_route53_record" "reverse" {
  count = "${var.instance_count}"

  name = "${format("%s.%s.%s.10.in-addr.arpa",
    element(split(".", element(aws_instance.rabbitmq.*.private_ip, count.index)), 3),
    element(split(".", element(aws_instance.rabbitmq.*.private_ip, count.index)), 2),
    element(split(".", element(aws_instance.rabbitmq.*.private_ip, count.index)), 1)
  )}"
  type = "PTR"
  ttl = "5"
  zone_id = "${var.reverse_zone_id}"

  records = ["${element(aws_route53_record.rabbitmq.*.fqdn, count.index)}"]
}
