# Atlas Production 2.0 Account - Users

resource "aws_iam_user" "atlas_apt_repo_user" {
  name = "atlas_apt_repo_curator_user"
}
