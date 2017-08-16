# Atlas DC/OS Public Workers Module - Outputs

output "autoscaling_group" {
  value = "${aws_autoscaling_group.default.id}"
}

output "asg_capacity" {
  value = "${var.asg_capacity}"
}

output "iam_role_arn" {
  value = "${aws_iam_role.default.arn}"
}

output "iam_role_name" {
  value = "${aws_iam_role.default.name}"
}

output "stack_name" {
  value = "${var.stack_name}"
}

output "stack_name_short" {
  value = "${var.stack_name_short}"
}
