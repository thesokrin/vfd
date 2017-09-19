# Atlas Production - GoCD Resources - IAM

resource "aws_iam_instance_profile" "gocd_server" {
  name = "atlas_${data.terraform_remote_state.environment.env_name_short}_${replace(var.gocd_server_name, "-", "_")}_profile"

  roles = [
    "${var.gocd_server_ec2_iam_role}",
  ]

  lifecycle {
    create_before_destroy = true
  }
}
