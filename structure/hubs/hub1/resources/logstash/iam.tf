# Atlas Hub - Logstash Resources - IAM

resource "aws_iam_instance_profile" "default" {
  name = "atlas_hub_logstash_profile"

  roles = [
    "atlas_ec2_assume_role",
  ]
}
