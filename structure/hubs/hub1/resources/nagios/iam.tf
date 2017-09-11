# Atlas Hub - Nagios Resources - IAM

resource "aws_iam_instance_profile" "default" {
  name = "atlas_${var.env_name_short}_nagios_profile"

  roles = [
    "atlas_ec2_assume_role"
  ]
}
