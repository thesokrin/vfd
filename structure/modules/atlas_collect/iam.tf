#  Atlas Collect Module - IAM

resource "aws_iam_instance_profile" "default" {
  name = "atlas_${var.stack_name_short}_collect_profile"
  roles = [
    "${var.ec2_iam_role}"
  ]
}
