# Atlas Preprod Account - IAM Resources - Users Bots

resource "aws_iam_user" "gocd_development_deploy_user" {
  name = "atlas_gocd_development_deploy_user"
  path = "/bots/isre/"
}
