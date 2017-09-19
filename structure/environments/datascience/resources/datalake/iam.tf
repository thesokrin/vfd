# Atlas Data-Science Environment - Datalake Resources - IAM

resource "aws_iam_user" "default" {
  name = "atlas_${var.env_name}_${var.name}_storage_manager_user"
}

resource "aws_iam_group" "default" {
  name = "atlas_${var.env_name}_${var.name}_storage_manager_group"
}

resource "aws_iam_group_membership" "default" {
  name = "${aws_iam_group.default.name}_membership"
  group = "${aws_iam_group.default.name}"
  users = [
    "${aws_iam_user.default.name}",
    "data.engineering"
  ]
}

data "template_file" "group_policy" {
  template = "${file("${path.module}/templates/storage-manager-group-policy.json.tpl")}"

  vars {
    aws_account_id = "${var.aws_account_id}"
    bucket = "${aws_s3_bucket.default.bucket}"
  }
}

resource "aws_iam_policy" "default" {
  name = "atlas_${var.env_name}_${var.name}_storage_manager"
  description = "Allows read-write permissions to the storage bucket for ${var.name}.${var.zone}"
  policy = "${data.template_file.group_policy.rendered}"
}

resource "aws_iam_policy_attachment" "default" {
  name = "${aws_iam_policy.default.name}_attachment"
  groups = ["${aws_iam_group.default.name}"]
  policy_arn = "${aws_iam_policy.default.arn}"
}
