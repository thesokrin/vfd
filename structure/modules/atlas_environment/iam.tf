# Atlas Environment - IAM Resources

data "template_file" "repo_bucket_policy" {
  template = "${file("${path.module}/templates/repo-bucket-policy.json.tpl")}"

  vars {
    bucket = "${aws_s3_bucket.repository.bucket}"
    aws_account_id = "${module.stack.aws_account_id}"
    vpc_endpoint_id = "${module.stack.s3_endpoint_id}"
  }
}

resource "aws_s3_bucket_policy" "repository" {
  bucket = "${aws_s3_bucket.repository.bucket}"
  policy = "${data.template_file.repo_bucket_policy.rendered}"
}

resource "aws_iam_user" "repository" {
  name = "atlas_${var.name_short}_repo_curator_user"
}

resource "aws_iam_group" "repository" {
  name = "atlas_${var.name_short}_repo_curator_group"
}

resource "aws_iam_group_membership" "repository" {
  name = "${aws_iam_group.repository.name}_membership"
  group = "${aws_iam_group.repository.name}"
  users = ["${aws_iam_user.repository.name}"]
}

data "template_file" "repo_group_policy" {
  template = "${file("${path.module}/templates/repo-group-policy.json.tpl")}"

  vars {
    aws_account_id = "${module.stack.aws_account_id}"
    bucket = "${aws_s3_bucket.repository.bucket}"
  }
}

resource "aws_iam_policy" "repository" {
  name = "atlas_${var.name_short}_repo_curator"
  description = "Curator/admin policy for access to the ${var.name_fancy} repository bucket."
  policy = "${data.template_file.repo_group_policy.rendered}"
}

resource "aws_iam_group_policy_attachment" "repository" {
  group = "${aws_iam_group.repository.name}"
  policy_arn = "${aws_iam_policy.repository.arn}"
}
