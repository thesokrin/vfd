# Atlas CDN Module - IAM Resources

resource "aws_iam_user" "default" {
  name = "atlas_${var.env_name_short}_cdn_curator_user"
}

resource "aws_iam_group" "default" {
  name = "atlas_${var.env_name_short}_cdn_curator_group"
}

resource "aws_iam_group_membership" "default" {
  name = "${aws_iam_group.default.name}_membership"
  group = "${aws_iam_group.default.name}"
  users = [
    "${aws_iam_user.default.name}"
  ]
}

data "template_file" "group_policy" {
  template = "${file("${path.module}/templates/curator-group-policy.json.tpl")}"

  vars {
    aws_account_id = "${data.aws_caller_identity.current.account_id}"
    bucket = "${aws_s3_bucket.default.bucket}"
  }
}

resource "aws_iam_policy" "default" {
  name = "atlas_${var.env_name_short}_cdn_curator"
  description = "Allows read-write permissions to the CDN bucket in the ${var.env_name_fancy}."
  policy = "${data.template_file.group_policy.rendered}"
}

resource "aws_iam_policy_attachment" "default" {
  name = "${aws_iam_policy.default.name}_attachment"
  groups = ["${aws_iam_group.default.name}"]
  policy_arn = "${aws_iam_policy.default.arn}"
}
