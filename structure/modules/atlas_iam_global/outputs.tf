# Atlas IAM Global Module - Outputs

output "atlas_xa_godlike_role" {
  value = "${aws_iam_role.xa_godlike.arn}"
}

output "team_groups" {
  value = [
    "${aws_iam_group.isre.name}"
  ]
}

output "team_group_arns" {
  value = [
    "${aws_iam_group.isre.arn}"
  ]
}
