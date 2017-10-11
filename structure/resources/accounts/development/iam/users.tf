# Atlas Preprod Account - IAM Resources - Users

resource "aws_iam_user" "travis_ami_builder" {
  name = "atlas_travis_ami_builder_user"
}

resource "aws_iam_user" "travis_seven_builder" {
  name = "atlas_travis_seven_ami_builder_user"
}
