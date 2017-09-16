# Atlas Kafka Module - Outputs

output "dns" {
  value = "${aws_route53_record.kafka_pool.fqdn}"
}

output "env_name" {
  value = "${var.env_name}"
}

output "env_name_short" {
  value = "${data.terraform_remote_state.environment.env_name_short}"
}

output "env_name_fancy" {
  value = "${data.terraform_remote_state.environment.env_name_fancy}"
}

output "hosts" {
  value = ["${aws_route53_record.kafka.*.fqdn}"]
}
