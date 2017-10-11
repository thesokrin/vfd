# Atlas Production 2.0 Account - Groups

resource "aws_iam_group" "atlas_apt_repo" {
  name = "atlas_apt_repo_group"
}

resource "aws_iam_group_membership" "atlas_apt_repo_group" {
  name  = "${aws_iam_group.atlas_apt_repo.name}"
  group = "${aws_iam_group.atlas_apt_repo.name}"
  users = ["${aws_iam_user.atlas_apt_repo_user.name}"]
}

# Gaymoji deployment user to manage s3 bucket object
resource "aws_iam_group" "gaymoji_curator" {
  name = "atlas_gaymoji_curator"
}
resource "aws_iam_group_policy_attachment" "gaymoji_curator_attachment" {
  group = "${aws_iam_group.gaymoji_curator.name}"
  policy_arn = "${aws_iam_policy.gaymoji_curator.arn}"
}

# datalake access group
resource "aws_iam_group" "s3_datalake_curator" {
  name = "atlas_s3_datalake_curator"
}

resource "aws_iam_group_policy_attachment" "s3_datalake_curator_attachment" {
  group = "${aws_iam_group.s3_datalake_curator.name}"
  policy_arn = "${aws_iam_policy.s3_datalake_curator.arn}"
}

resource "aws_iam_group_membership" "s3_datalake_curator_membership" {
  name = "${aws_iam_group.s3_datalake_curator.name}_authenticity_membership"
  group = "${aws_iam_group.s3_datalake_curator.name}"
  users = [
    "guillermo.alvarez",
    "javier.alvarez",
    "francisco.rossi"
  ]
}
