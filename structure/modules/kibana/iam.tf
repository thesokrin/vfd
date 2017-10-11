# Atlas Kibana Resources - IAM

resource "aws_iam_instance_profile" "default" {
  name = "atlas_${var.name}_kibana_profile"
  roles = [
    "atlas_ec2_assume_role"
  ]
}
