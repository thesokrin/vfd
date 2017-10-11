#Atlas Hub 1 - Kibana Resources - Outputs

output "autoscaling_group" {
  value = "${aws_autoscaling_group.default.id}"
}

output "asg_capacity" {
  value = "${var.asg_capacity}"
}
