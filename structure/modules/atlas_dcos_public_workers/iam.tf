# Atlas DC/OS Public Workers Module - IAM

resource "aws_iam_instance_profile" "default" {
  name = "atlas_${var.stack_name_short}_dcos_public_workers_profile"

  roles = [
    "${aws_iam_role.default.name}",
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role" "default" {
  name               = "atlas_${var.stack_name_short}_dcos_public_workers_role"
  assume_role_policy = "${file("${path.module}/../../resources/iam/policies/ec2_assume_role.json")}"
}

data "template_file" "dcos_workers_policy" {
  template = "${file("${path.module}/policies/dcos-workers-policy.json.tpl")}"

  vars {
    repo_bucket_name = "${var.s3_repo_bucket_name}"
  }
}

resource "aws_iam_policy" "default" {
  name        = "atlas_${var.stack_name_short}_dcos_public_workers"
  description = "${var.project_name_fancy} Access Policy in the ${var.stack_name_fancy}."
  policy      = "${data.template_file.dcos_workers_policy.rendered}"
}

resource "aws_iam_policy_attachment" "default" {
  name       = "${aws_iam_policy.default.name}_attachment"
  roles      = ["${aws_iam_role.default.name}"]
  policy_arn = "${aws_iam_policy.default.arn}"
}
