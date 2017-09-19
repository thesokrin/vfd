resource "aws_iam_user" "data_engineering" {
  name = "data.engineering"
  path = "/teams/dsci/"
  force_destroy = true
}
