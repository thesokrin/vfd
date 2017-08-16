# Atlas Collect Module - DNS

resource "aws_route53_record" "collect_pool" {
  name = "collect"
  type = "A"
  ttl = "5"
  zone_id = "${var.private_zone_id}"

  records = ["${aws_instance.collect.*.private_ip}"]
}

resource "aws_route53_record" "collect" {
  count = 3

  name = "collect-${count.index + 1}"
  type = "A"
  ttl = "5"
  zone_id = "${var.private_zone_id}"

  records = ["${element(aws_instance.collect.*.private_ip, count.index)}"]
}

resource "aws_route53_record" "reverse" {
  count = 3

  name = "${format("%s.%s.%s.10.in-addr.arpa",
    element(split(".", element(aws_instance.collect.*.private_ip, count.index)), 3),
    element(split(".", element(aws_instance.collect.*.private_ip, count.index)), 2),
    element(split(".", element(aws_instance.collect.*.private_ip, count.index)), 1)
  )}"
  type = "PTR"
  ttl = "5"
  zone_id = "${var.reverse_zone_id}"

  records = ["${element(aws_route53_record.collect.*.fqdn, count.index)}"]
}
