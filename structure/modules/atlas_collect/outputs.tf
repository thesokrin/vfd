# Atlas Collect Module - Outputs

output "dns" {
  value = "${aws_route53_record.collect_pool.fqdn}"
}

output "logs_destination" {
  value = "${var.logs_destination}"
}

output "metrics_destination" {
  value = "${var.metrics_destination}"
}

output "stack_name" {
  value = "${var.stack_name}"
}

output "stack_name_short" {
  value = "${var.stack_name_short}"
}

output "stack_name_fancy" {
  value = "${var.stack_name_fancy}"
}
