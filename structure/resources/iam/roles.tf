# Atlas Tier 1 IAM Roles

resource "aws_iam_role" "ec2_assume_role" {
  # all IAM instance profiles must include this role
  name = "atlas_ec2_assume_role"
  assume_role_policy = "${file("${path.module}/policies/ec2_assume_role.json")}"
}

resource "aws_iam_role" "redshift_assume_role" {
  # any redshift cluster wanting to use IAM permissions must at least include this role
  name = "atlas_redshift_assume_role"
  assume_role_policy = "${file("${path.module}/policies/redshift_assume_role.json")}"
}
