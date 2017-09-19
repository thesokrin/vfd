# Atlas Hub - Data Retention Resources - IAM

resource "aws_iam_user" "data_retention" {
  name = "atlas_${data.terraform_remote_state.hub.env_name_short}_data_retention_user"
  path = "/bots/authenticity/"
}

resource "aws_iam_group" "data_retention" {
  name = "atlas_${data.terraform_remote_state.hub.env_name_short}_data_retention_group"
  path = "/bots/"
}

data "template_file" "data_retention_iam_policy" {
  template = "${file("${path.module}/policies/policy.json.tpl")}"
  vars {
    source_bucket = "${var.source_bucket_name}"
    destination_bucket = "${aws_s3_bucket.chat_image_archive.bucket}"
  }
}

resource "aws_iam_policy" "data_retention" {
  name = "atlas_${data.terraform_remote_state.hub.env_name_short}_data_retention_s3_access"
  description = "Data Retention policy in the ${data.terraform_remote_state.hub.env_name_fancy}."
  policy = "${data.template_file.data_retention_iam_policy.rendered}"
}

resource "aws_iam_group_policy_attachment" "data_retention_attachment" {
  group = "${aws_iam_group.data_retention.name}"
  policy_arn = "${aws_iam_policy.data_retention.arn}"
}

resource "aws_iam_group_membership" "data_retention" {
  name = "${aws_iam_group.data_retention.name}_membership"
  group = "${aws_iam_group.data_retention.name}"
  users = [
    "${aws_iam_user.data_retention.name}",
    "guillermo.alvarez"
  ]
}
