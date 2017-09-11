#Atlas Kibana Resources - Outputs

output "dns" {
  value = "${aws_route53_record.loadbalancer.fqdn}"
}

output "ec2_instance_count" {
  value = "${var.ec2_instance_count}"
}

output "ec2_instance_type" {
  value = "${var.ec2_instance_type}"
}

output "role_package" {
  value = "${var.role_package}"
}
