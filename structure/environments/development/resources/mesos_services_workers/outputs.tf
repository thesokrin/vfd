# Atlas Development Environment - Mesos Services Workers - Outputs

output "autoscaling_group" {
  value = "${aws_autoscaling_group.default.id}"
}

output "asg_capacity" {
  value = "${var.asg_capacity}"
}
