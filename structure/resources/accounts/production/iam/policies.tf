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