# Codis Proxy Module - DNS Resources

resource "aws_route53_record" "private" {
  count = "${var.instance_count}"

  name    = "${var.name}-${count.index + 1}"
  type    = "A"
  ttl     = "120"
  zone_id = "${data.terraform_remote_state.atlas.private_zone_id}"

  records = ["${element(aws_instance.default.*.private_ip, count.index)}"]
}

resource "aws_route53_record" "reverse" {
  count = "${var.instance_count}"

  zone_id = "${data.terraform_remote_state.atlas.reverse_zone_id}"
  name = "${
    format("%s.%s.%s.10.in-addr.arpa",
      element(split(".", element(aws_instance.default.*.private_ip, count.index)), 3),
      element(split(".", element(aws_instance.default.*.private_ip, count.index)), 2),
      element(split(".", element(aws_instance.default.*.private_ip, count.index)), 1),
    )
  }"
  type = "PTR"
  ttl = "120"
  records = ["${var.name}-${count.index + 1}"]
}

resource "aws_route53_record" "pool" {
  name    = "${var.name}"
  type    = "A"
  ttl     = "120"
  zone_id = "${data.terraform_remote_state.atlas.private_zone_id}"

  # pool at codis.$ZONE
  records = ["${aws_instance.default.*.private_ip}"]
}

resource "aws_route53_record" "srv" {
  name    = "${var.name}"
  type    = "SRV"
  ttl     = "120"
  zone_id = "${data.terraform_remote_state.atlas.private_zone_id}"

  # pool at codis.$ZONE
  records = ["${formatlist("0 100 6379 %s", aws_route53_record.private.*.fqdn)}"]
}
