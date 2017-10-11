# Atlas Hub 1 - Kibana Resources - IAM

resource "aws_iam_instance_profile" "default" {
  name = "atlas_hub_kibana_profile"
  roles = [
    "atlas_ec2_assume_role"
  ]
}
