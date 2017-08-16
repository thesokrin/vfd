# Atlas Artemis Module - IAM

resource "aws_iam_instance_profile" "default" {
  name = "atlas_${var.env_name_short}_${replace(var.name, "-", "_")}_profile"
  roles = [
    "${aws_iam_role.default.name}"
  ]

  lifecycle {
    create_before_destroy = false
  }
}

resource "aws_iam_role" "default" {
  name = "atlas_${var.env_name_short}_${replace(var.name, "-", "_")}_role"
  assume_role_policy = "${file("${path.module}/../../resources/iam/policies/ec2_assume_role.json")}"
}

data "template_file" "artemis_iam_policy" {
  template = "${file("${path.module}/policies/artemis-policy.json.tpl")}"
}

resource "aws_iam_policy" "default" {
  name = "atlas_${var.env_name_short}_${replace(var.name, "-", "_")}"
  description = "${var.name} policy in the ${var.env_name_fancy}."
  policy = "${data.template_file.artemis_iam_policy.rendered}"
}

resource "aws_iam_policy_attachment" "default" {
  name = "${aws_iam_role.default.name}_attachment"
  roles = ["${aws_iam_role.default.name}"]
  policy_arn = "${aws_iam_policy.default.arn}"
}
