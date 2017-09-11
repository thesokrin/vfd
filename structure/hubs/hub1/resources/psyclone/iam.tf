# Atlas Hub - Psyclone Resources - IAM

resource "aws_iam_role" "default" {
  name = "atlas_${data.terraform_remote_state.environment.env_name_short}_psyclone_role"
  assume_role_policy = "${file("${path.module}/../../../../resources/iam/policies/ec2_assume_role.json")}"
}

data "template_file" "psyclone_iam_policy" {
  template = "${file("${path.module}/policies/policy.json.tpl")}"
  vars {
    source_bucket = "${var.source_bucket_name}"
    destination_bucket = "${aws_s3_bucket.default.bucket}"
  }
}

resource "aws_iam_policy" "default" {
  name = "atlas_${data.terraform_remote_state.environment.env_name_short}_psyclone"
  description = "Psyclone policy in the ${data.terraform_remote_state.environment.env_name_fancy}."
  policy = "${data.template_file.psyclone_iam_policy.rendered}"
}

resource "aws_iam_policy_attachment" "default" {
  name = "${aws_iam_role.default.name}_attachment"
  roles = ["${aws_iam_role.default.name}"]
  policy_arn = "${aws_iam_policy.default.arn}"
}
