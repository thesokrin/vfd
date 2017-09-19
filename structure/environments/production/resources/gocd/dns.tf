# Atlas Production - GoCD Resources - DNS

resource "aws_route53_record" "gocd_server_private" {
  name    = "${var.gocd_server_name}"
  type    = "A"
  ttl     = "5"
  zone_id = "${data.terraform_remote_state.environment.private_zone_id}"

  records = ["${aws_instance.gocd_server.private_ip}"]
}

resource "aws_route53_record" "reverse" {
  name = "${format("%s.%s.%s.10.in-addr.arpa",
    element(split(".", aws_instance.gocd_server.private_ip), 3),
    element(split(".", aws_instance.gocd_server.private_ip), 2),
    element(split(".", aws_instance.gocd_server.private_ip), 1)
  )}"

  type    = "PTR"
  ttl     = "5"
  zone_id = "${data.terraform_remote_state.environment.reverse_zone_id}"

  records = ["${aws_route53_record.gocd_server_private.fqdn}"]
}
