# Atlas Redis Cluster Resources Module - Outputs

output "ec2_iam_role" {
  value = "${var.ec2_iam_role}"
}

output "iam_instance_profile" {
  value = "${aws_iam_instance_profile.default.name}"
}

output "name" {
  value = "${var.name}"
}

output "security_group_id" {
  value = "${aws_security_group.default.id}"
}

output "zone" {
  value = "${var.zone}"
}
