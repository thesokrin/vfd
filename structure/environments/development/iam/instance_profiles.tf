# Atlas Development Environment - Tier 2 IAM Resources - Instance Profiles

resource "aws_iam_instance_profile" "default" {
  name = "atlas_dev_default_profile"
  roles = [
    "atlas_ec2_assume_role"
  ]
}
