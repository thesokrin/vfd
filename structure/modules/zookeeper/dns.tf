# Atlas Zookeeper Module - DNS

resource "aws_route53_record" "zookeeper_pool" {
  name    = "${var.name}"
  type    = "A"
  ttl     = "5"
  zone_id = "${var.private_zone_id}"

  records = ["${aws_instance.zookeeper.*.private_ip}"]
}

resource "aws_route53_record" "zookeeper" {
  count = "${var.ec2_instance_count}"

  name    = "${var.name}-${count.index + 1}"
  type    = "A"
  ttl     = "5"
  zone_id = "${var.private_zone_id}"

  records = ["${element(aws_instance.zookeeper.*.private_ip, count.index)}"]
}

resource "aws_route53_record" "reverse" {
  count = "${var.ec2_instance_count}"

  name = "${format("%s.%s.%s.10.in-addr.arpa",
    element(split(".", element(aws_instance.zookeeper.*.private_ip, count.index)), 3),
    element(split(".", element(aws_instance.zookeeper.*.private_ip, count.index)), 2),
    element(split(".", element(aws_instance.zookeeper.*.private_ip, count.index)), 1)
  )}"

  type    = "PTR"
  ttl     = "5"
  zone_id = "${var.reverse_zone_id}"

  records = ["${element(aws_route53_record.zookeeper.*.fqdn, count.index)}"]
}

resource "aws_route53_record" "srv" {
  name    = "${var.name}"
  type    = "SRV"
  ttl     = 60
  zone_id = "${var.private_zone_id}"
  records = ["${formatlist("0 100 2181 %s", aws_route53_record.zookeeper.*.fqdn)}"]
}
