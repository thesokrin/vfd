# Chat Presence Module - IAM Resources

resource "aws_iam_instance_profile" "default" {
  name = "atlas_${var.env_name_short}_presence_profile"

  roles = [
    "${var.instance_iam_role}",
  ]

  lifecycle {
    create_before_destroy = true
  }
}
