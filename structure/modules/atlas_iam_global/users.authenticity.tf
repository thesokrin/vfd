# Atlas IAM Global Module - Authenticity Users

resource "aws_iam_user" "guillermo_alvarez" {
  name = "guillermo.alvarez"
  path = "/teams/authenticity/"
  force_destroy = true
}

resource "aws_iam_user" "javier_alvarez" {
  name = "javier.alvarez"
  path = "/teams/authenticity/"
  force_destroy = true
}

resource "aws_iam_user" "francisco_rossi" {
  name = "francisco.rossi"
  path = "/teams/authenticity/"
  force_destroy = true
}

resource "aws_iam_group_membership" "authenticity" {
  name = "${aws_iam_group.authenticity.name}_membership"
  group = "${aws_iam_group.authenticity.name}"
  users = [
    "${aws_iam_user.guillermo_alvarez.name}",
    "${aws_iam_user.javier_alvarez.name}",
    "${aws_iam_user.francisco_rossi.name}",
  ]
}
