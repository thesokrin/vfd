# Atlas Production 2.0 Account - Policies

resource "aws_iam_policy" "repository" {
  name        = "atlas_apt_repo_curator"
  description = "Curator/admin policy for management of the main apt repository bucket."
  policy      = "${file("${path.module}/policies/apt_iam_s3.json")}"
}

resource "aws_iam_group_policy_attachment" "repository" {
  group      = "${aws_iam_group.atlas_apt_repo.name}"
  policy_arn = "${aws_iam_policy.repository.arn}"
}

# Gaymoji curator policy
resource "aws_iam_policy" "gaymoji_curator" {
  name = "atlas_gaymoji_curator"
  description = "Policy to define s3 permissions to add and update objects for gaymojis"
  policy = "${data.template_file.gaymoji_curator.rendered}"
}

data "template_file" "gaymoji_curator" {
  template = "${file("${path.module}/policies/gaymoji-curator-policy.json.tpl")}"
  vars {
    bucket = "s3.grindr.com"
    gaymoji_index_file = "grindr/chat/gaymoji"
    gaymoji_path = "grindr/chat/gaymoji/"
  }
}

# Gaymoji curator policy
resource "aws_iam_policy" "s3_datalake_curator" {
  name = "atlas_s3_datalake_curator"
  description = "Policy to define s3 permissions to add and update objects for datalake"
  policy = "${data.template_file.s3_datalake_curator.rendered}"
}

data "template_file" "s3_datalake_curator" {
  template = "${file("${path.module}/policies/s3-datalake-curator-policy.json.tpl")}"
  vars {
    bucket = "datalake.grindr.io"
  }
}
