# Atlas DC/OS Masters Module - IAM

resource "aws_iam_instance_profile" "default" {
  name = "atlas_${var.stack_name_short}_dcos_masters_profile"

  roles = [
    "${aws_iam_role.default.name}",
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role" "default" {
  name               = "atlas_${var.stack_name_short}_dcos_masters_role"
  assume_role_policy = "${file("${path.module}/../../resources/iam/policies/ec2_assume_role.json")}"
}

data "template_file" "dcos_masters_policy" {
  template = "${file("${path.module}/policies/dcos-masters-policy.json.tpl")}"

  vars {
    bucket_name = "${aws_s3_bucket.exhibitor.id}"
  }
}

resource "aws_iam_policy" "default" {
  name        = "atlas_${var.stack_name_short}_dcos_masters"
  description = "DC/OS Masters Access Policy in the ${var.stack_name_fancy}."
  policy      = "${data.template_file.dcos_masters_policy.rendered}"
}

resource "aws_iam_policy_attachment" "default" {
  name       = "${aws_iam_policy.default.name}_attachment"
  roles      = ["${aws_iam_role.default.name}"]
  policy_arn = "${aws_iam_policy.default.arn}"
}
