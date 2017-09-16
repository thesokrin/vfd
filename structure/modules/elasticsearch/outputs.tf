# Atlas Elasticsearch Module - Outputs

output "dns" {
  value = "${aws_route53_record.loadbalancer.fqdn}"
}

output "asg_capacity" {
  value = "${var.asg_capacity}"
}

output "ec2_instance_type" {
  value = "${var.ec2_instance_type}"
}

output "role_package" {
  value = "${var.role_package}"
}
