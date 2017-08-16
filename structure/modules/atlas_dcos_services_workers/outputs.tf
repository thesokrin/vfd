# Atlas DC/OS Services Workers Module - Outputs

output "autoscaling_group" {
  value = "${aws_autoscaling_group.default.id}"
}

output "asg_capacity" {
  value = "${var.asg_capacity}"
}

output "stack_name" {
  value = "${var.stack_name}"
}

output "stack_name_short" {
  value = "${var.stack_name_short}"
}
