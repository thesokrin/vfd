# Atlas Production Account - IAM Resources - Groups

resource "aws_iam_group" "travis_elasticbs" {
  name = "atlas_travis_elasticbs_group"
}

resource "aws_iam_group_membership" "travis_elasticbs" {
  name = "${aws_iam_group.travis_elasticbs.name}_membership"
  group = "${aws_iam_group.travis_elasticbs.name}"
  users = [
    "${aws_iam_user.atlas_prod_ad_service_travis.name}",
  ]
}

resource "aws_iam_group_policy_attachment" "travis_elasticbs" {
  group = "${aws_iam_group.travis_elasticbs.name}"
  policy_arn = "${aws_iam_policy.travis_elasticbs.arn}"
}
