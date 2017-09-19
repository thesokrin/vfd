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

# gocd group
resource "aws_iam_group" "gocd_development_deploy" {
  name = "atlas_gocd_development_deploy_group"
}

resource "aws_iam_group_policy_attachment" "gocd_development_deploy_attachment" {
  group = "${aws_iam_group.gocd_development_deploy.name}"
  policy_arn = "${aws_iam_policy.gocd_development_deploy.arn}"
}

resource "aws_iam_group_membership" "gocd_development_deploy_membership" {
  name = "${aws_iam_group.gocd_development_deploy.name}_membership"
  group = "${aws_iam_group.gocd_development_deploy.name}"
  users = ["${aws_iam_user.gocd_development_deploy_user.name}"]
}
