# Atlas Manager Module - Outputs

output "dns" {
  value = "${aws_route53_record.manager_external.fqdn}"
}

output "public_ip" {
  value = "${aws_eip.manager.public_ip}"
}

output "private_ip" {
  value = "${aws_instance.manager.private_ip}"
}
