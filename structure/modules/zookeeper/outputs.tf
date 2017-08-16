# Atlas Zookeeper Module - Outputs

output "dns" {
  value = "${aws_route53_record.zookeeper_pool.fqdn}"
}

output "env_name" {
  value = "${var.env_name}"
}

output "env_name_short" {
  value = "${var.env_name_short}"
}

output "env_name_fancy" {
  value = "${var.env_name_fancy}"
}

output "hosts" {
  value = ["${aws_route53_record.zookeeper.*.fqdn}"]
}
