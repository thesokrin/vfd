# Codis Proxy Module - IAM Resources

resource "aws_iam_instance_profile" "default" {
  name = "atlas_${data.terraform_remote_state.atlas.env_name_short}_${replace(var.name, "-", "_")}_profile"
  roles = [
    "${var.role_name}"
  ]
}
