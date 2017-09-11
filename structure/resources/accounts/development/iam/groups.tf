# Atlas Preprod Account - IAM Resources - Groups

resource "aws_iam_group" "ami_builder" {
  name = "atlas_ami_builder_group"
}

resource "aws_iam_group_membership" "ami_builder" {
  name = "${aws_iam_group.ami_builder.name}_membership"
  group = "${aws_iam_group.ami_builder.name}"
  users = [
    "${aws_iam_user.travis_ami_builder.name}",
    "${aws_iam_user.travis_seven_builder.name}"
  ]
}

resource "aws_iam_group_policy_attachment" "ami_builder" {
  group = "${aws_iam_group.ami_builder.name}"
  policy_arn = "${aws_iam_policy.ami_builder.arn}"
}
