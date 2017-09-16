# Atlas IAM Global Module - ISRE Users

resource "aws_iam_user" "chas" {
  name = "chas.corbett"
  path = "/teams/isre/"
  force_destroy = true
}

resource "aws_iam_user" "joshua" {
  name = "joshua.lai"
  path = "/teams/isre/"
  force_destroy = true
}

resource "aws_iam_user" "matt" {
  name = "matt.demery"
  path = "/teams/isre/"
  force_destroy = true
}

resource "aws_iam_user" "naftuli" {
  name = "naftuli.kay"
  path = "/teams/isre/"
  force_destroy = false
}

resource "aws_iam_user" "rosalba" {
  name = "rosalba.vergara"
  path = "/teams/isre/"
  force_destroy = true
}

resource "aws_iam_user" "shelby" {
  name = "shelby.spees"
  path = "/teams/isre/"
  force_destroy = true
}

resource "aws_iam_user" "slava" {
  name = "slava.maslennikov"
  path = "/teams/isre/"
  force_destroy = true
}

# memberships
resource "aws_iam_group_membership" "isre_godlike" {
  name = "${aws_iam_group.godlike.name}_isre_membership"
  group = "${aws_iam_group.godlike.name}"
  users = [
    "${aws_iam_user.chas.name}",
    "${aws_iam_user.joshua.name}",
    "${aws_iam_user.matt.name}",
    "${aws_iam_user.naftuli.name}",
    "${aws_iam_user.rosalba.name}",
    "${aws_iam_user.shelby.name}",
    "${aws_iam_user.slava.name}"
  ]
}

resource "aws_iam_group_membership" "isre_team" {
  name = "${aws_iam_group.isre.name}_membership"
  group = "${aws_iam_group.isre.name}"
  users = [
    "${aws_iam_user.chas.name}",
    "${aws_iam_user.joshua.name}",
    "${aws_iam_user.matt.name}",
    "${aws_iam_user.naftuli.name}",
    "${aws_iam_user.rosalba.name}",
    "${aws_iam_user.shelby.name}",
    "${aws_iam_user.slava.name}"
  ]
}
