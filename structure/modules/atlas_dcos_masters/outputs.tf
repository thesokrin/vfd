# Atlas DC/OS Masters Module - Outputs

output "dcos_role_name" {
  value = "${aws_iam_role.default.name}"
}

output "dcos_role_name_arn" {
  value = "${aws_iam_role.default.arn}"
}

output "stack_name" {
  value = "${var.stack_name}"
}

output "stack_name_fancy" {
  value = "${var.stack_name_fancy}"
}

output "stack_name_short" {
  value = "${var.stack_name_short}"
}
