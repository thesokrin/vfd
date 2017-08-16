# Atlas Autospotting Module - IAM Resources

resource "aws_iam_role" "default" {
  name = "atlas_${replace(var.name, "-", "_")}_role"
  path = "/lambda/"
  assume_role_policy = "${data.template_file.autospotting_assume_role.rendered}"
}

resource "aws_iam_policy" "default" {
  name = "atlas_${replace(var.name, "-", "_")}"
  description = "${var.name} policy for the current account."
  policy = "${data.template_file.autospotting_role_policy.rendered}"
}

resource "aws_iam_policy_attachment" "default" {
  name = "${aws_iam_role.default.name}_attachment"
  roles = [
    "${aws_iam_role.default.name}"
  ]
  policy_arn = "${aws_iam_policy.default.arn}"
}

data "template_file" "autospotting_assume_role" {
  template = "${file("${path.module}/templates/assume/autospotting-assume-role.json")}"
}

data "template_file" "autospotting_role_policy" {
  template = "${file("${path.module}/templates/policies/autospotting-role-policy.json")}"
}
