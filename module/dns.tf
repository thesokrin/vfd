# Atlas Kafka Module - DNS Resources

resource "aws_route53_record" "kafka_pool" {
  name    = "${var.name}"
  type    = "A"
  ttl     = "5"
  zone_id = "${data.terraform_remote_state.environment.private_zone_id}"

  records = ["${aws_instance.kafka.*.private_ip}"]
}

resource "aws_route53_record" "kafka" {
  count = "${var.ec2_instance_count}"

  name = "${var.name}-${count.index + 1}"
  type = "A"
  ttl = "5"
  zone_id = "${data.terraform_remote_state.environment.private_zone_id}"
  records = ["${element(aws_instance.kafka.*.private_ip, count.index)}"]
}

resource "aws_route53_record" "reverse" {
  count = "${var.ec2_instance_count}"

  name = "${format("%s.%s.%s.10.in-addr.arpa",
    element(split(".", element(aws_instance.kafka.*.private_ip, count.index)), 3),
    element(split(".", element(aws_instance.kafka.*.private_ip, count.index)), 2),
    element(split(".", element(aws_instance.kafka.*.private_ip, count.index)), 1)
  )}"
  type = "PTR"
  ttl = "5"
  zone_id = "${data.terraform_remote_state.environment.reverse_zone_id}"
  records = ["${var.name}-${count.index + 1}.${data.terraform_remote_state.environment.zone}"]
}

resource "aws_route53_record" "srv" {
  name    = "${var.name}"
  type    = "SRV"
  ttl     = 60
  zone_id = "${data.terraform_remote_state.environment.private_zone_id}"
  records = ["${formatlist("0 100 9092 %s", aws_route53_record.kafka.*.fqdn)}"]
}
