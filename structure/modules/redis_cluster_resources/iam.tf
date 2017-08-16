#  Atlas Redis Cluster Resources Module - IAM

resource "aws_iam_instance_profile" "default" {
  name = "atlas_${var.env_name_short}_${replace(var.name, "-", "_")}_profile"
  roles = [
    "${var.ec2_iam_role}"
  ]
}
