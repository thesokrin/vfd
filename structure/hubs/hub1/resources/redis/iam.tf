# Atlas Hub 1 - Redis Resources - IAM

resource "aws_iam_instance_profile" "default" {
  name = "atlas_hub_redis_profile"
  roles = [
    "atlas_ec2_assume_role"
  ]
}
