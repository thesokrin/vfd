# Atlas IAM Global Module - Groups

resource "aws_iam_group" "godlike" {
  name = "atlas_godlike_group"
}

resource "aws_iam_group_policy_attachment" "godlike" {
  group = "${aws_iam_group.godlike.name}"
  policy_arn = "${aws_iam_policy.godlike.arn}"
}

resource "aws_iam_group" "authenticity" {
  name = "atlas_authenticity_team_group"
  path = "/teams/"
}

resource "aws_iam_group" "isre" {
  name = "atlas_isre_team_group"
  path = "/teams/"
}

# read only iam group
resource "aws_iam_group" "limited_read_only" {
  name = "atlas_limited_read_only_group"
  path = "/"
}

resource "aws_iam_group_policy_attachment" "limited_read_only" {
  group = "${aws_iam_group.limited_read_only.name}"
  policy_arn = "${aws_iam_policy.limited_read_only.arn}"
}

# ansible group
resource "aws_iam_group" "ansible" {
  name = "atlas_ansible_group"
  path = "/"
}

resource "aws_iam_group_policy_attachment" "ansible" {
  group = "${aws_iam_group.ansible.name}"
  policy_arn = "${aws_iam_policy.ansible.arn}"
}

# self manage group
resource "aws_iam_group" "manage_self" {
  name = "atlas_manage_self_group"
  path = "/"
}

resource "aws_iam_group_policy_attachment" "manage_self" {
  group = "${aws_iam_group.manage_self.name}"
  policy_arn = "${aws_iam_policy.manage_self.arn}"
}
