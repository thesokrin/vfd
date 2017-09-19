# Atlas Production Account - IAM Resources - Policies

data "template_file" "travis_elasticbs" {
  template = "${file("${path.module}/policies/atlas-travis-elasticbs-policy.json.tpl")}"
}

resource "aws_iam_policy" "travis_elasticbs" {
  name = "atlas_travis_elasticbs"
  description = "Allows actions required for deploying to elasticbs from travis."
  policy = "${data.template_file.travis_elasticbs.rendered}"
}

data "template_file" "redshift_spectrum" {
  template = "${file("${path.module}/policies/atlas-redshift-spectrum-policy.json.tpl")}"
}

resource "aws_iam_policy" "redshift_spectrum" {
  name = "atlas_redshift_spectrum"
  description = "Allows actions required for spectrum to access redshift"
  policy = "${data.template_file.redshift_spectrum.rendered}"
}

data "template_file" "td_backfill_access" {
  template = "${file("${path.module}/policies/td_backfill_access.json.tpl")}"

  vars {
    bucket = "td-backfill-ds"
    aws_account_id = "${var.aws_account_id}"
  } 
}

resource "aws_iam_policy" "td_backfill_access" {
  name = "td_backfill_access"
  description = "Programmatic access to td-backfill-ds buckets"
  policy = "${data.template_file.td_backfill_access.rendered}"
}
