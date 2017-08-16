#  Atlas Zookeeper Module - IAM

resource "aws_iam_instance_profile" "default" {
  name = "atlas_${var.env_name_short}_${var.name}_profile"

  roles = [
    "${aws_iam_role.default.name}",
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role" "default" {
  name = "atlas_${var.env_name_short}_${replace(var.name, "-", "_")}_role"

  assume_role_policy = "${file("${path.module}/../../resources/iam/policies/ec2_assume_role.json")}"
}

data "template_file" "zookeeper_policy" {
  template = "${file("${path.module}/policies/zookeeper-policy.json.tpl")}"

  vars {
    bucket_name = "${aws_s3_bucket.exhibitor.id}"
  }
}

resource "aws_iam_policy" "default" {
  name = "atlas_${var.env_name_short}_${replace(var.name, "-", "_")}"

  description = "Zookeeper/Exhibitor (${var.name}) Access Policy in the ${var.env_name_fancy}."
  policy      = "${data.template_file.zookeeper_policy.rendered}"
}

resource "aws_iam_policy_attachment" "default" {
  name = "${aws_iam_role.default.name}_attachment"

  roles      = ["${aws_iam_role.default.name}"]
  policy_arn = "${aws_iam_policy.default.arn}"
}
