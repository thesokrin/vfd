# Atlas RabbitMQ Module - Outputs

output "dns_pool" {
  value = "${aws_route53_record.rabbitmq_pool.fqdn}"
}

output "hosts" {
  value = ["${aws_route53_record.rabbitmq.*.fqdn}"]
}

output "elb" {
  value = ["${aws_route53_record.elb_rabbitmq.*.fqdn}"]
}

output "exported_modules" {
  value = []
}