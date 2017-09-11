# Atlas Production - GoCD Resources - IAM

resource "aws_iam_role" "master" {
  name = "atlas_prod_gocd_master_role"
  assume_role_policy = "${file("${path.module}/../../../../resources/iam/policies/ec2_assume_role.json")}"
}
