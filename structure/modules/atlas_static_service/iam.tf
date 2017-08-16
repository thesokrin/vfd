#  Atlas Static Services Module - IAM

resource "aws_iam_instance_profile" "default" {
  name = "atlas_${data.terraform_remote_state.environment.env_name_short}_${replace(var.name, "-", "_")}_profile"

  roles = [
    "${var.ec2_iam_role}",
  ]

  lifecycle {
    create_before_destroy = true
  }
}
