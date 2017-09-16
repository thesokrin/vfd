# Atlas IAM Global Module - Roles

data "template_file" "xa_godlike_assume_role" {
  template = "${file("${path.module}/templates/assume/atlas-xa-assume-godlike-role.json.tpl")}"

  vars {
    # this is the only way for us to reasonably do this right now
    allowed_users = "${jsonencode(concat(
      formatlist("arn:aws:iam::%s:user/teams/isre/%s", values(var.aws_account_ids), "${aws_iam_user.chas.name}"),
      formatlist("arn:aws:iam::%s:user/teams/isre/%s", values(var.aws_account_ids), "${aws_iam_user.joshua.name}"),
      formatlist("arn:aws:iam::%s:user/teams/isre/%s", values(var.aws_account_ids), "${aws_iam_user.matt.name}"),
      formatlist("arn:aws:iam::%s:user/teams/isre/%s", values(var.aws_account_ids), "${aws_iam_user.naftuli.name}"),
      formatlist("arn:aws:iam::%s:user/teams/isre/%s", values(var.aws_account_ids), "${aws_iam_user.rosalba.name}"),
      formatlist("arn:aws:iam::%s:user/teams/isre/%s", values(var.aws_account_ids), "${aws_iam_user.shelby.name}"),
      formatlist("arn:aws:iam::%s:user/teams/isre/%s", values(var.aws_account_ids), "${aws_iam_user.slava.name}")
    ))}"
  }
}

resource "aws_iam_role" "xa_godlike" {
  # cross-account godlike role
  name = "atlas_xa_godlike_role"
  assume_role_policy = "${data.template_file.xa_godlike_assume_role.rendered}"
}

resource "aws_iam_role_policy_attachment" "xa_godlike" {
  role = "${aws_iam_role.xa_godlike.name}"
  policy_arn = "${aws_iam_policy.godlike.arn}"
}
