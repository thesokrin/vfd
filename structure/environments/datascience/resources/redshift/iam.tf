# Atlas Data-Science Environment - Redshift Cluster Resources - IAM

resource "aws_iam_role" "default" {
  name               = "atlas_${var.env_name_short}_redshift_role"
  assume_role_policy = "${file("${path.module}/../../../../resources/iam/policies/redshift_assume_role.json")}"
}
