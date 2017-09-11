# Atlas Production Account - IAM Resources - Roles

data "template_file" "redshift_assume" {
  template = "${file("${path.module}/assume/redshift-assume-role.json")}"
}

resource "aws_iam_role" "atlas_prod_redshift_spectrum" {
  # role for redshift spectrum
  name = "atlas_prod_redshift_spectrum_role"
  assume_role_policy = "${data.template_file.redshift_assume.rendered}"
}

resource "aws_iam_role_policy_attachment" "redshift_spectrum" {
  role = "${aws_iam_role.atlas_prod_redshift_spectrum.name}"
  policy_arn = "${aws_iam_policy.redshift_spectrum.arn}"
}
