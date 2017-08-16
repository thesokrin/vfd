# Atlas Service Module - IAM

resource "aws_iam_instance_profile" "default" {
  name = "atlas_${var.env_name_short}_${var.name}_profile"
  roles = [
    "${var.iam_role}"
  ]

  lifecycle {
    create_before_destroy = true
  }
}
