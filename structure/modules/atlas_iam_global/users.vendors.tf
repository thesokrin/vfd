# Atlas IAM Global Module - Vendor Users

resource "aws_iam_user" "tenableio" {
  name = "tenable.io"
  path = "/vendors/"
  force_destroy = true
}

# memberships
resource "aws_iam_group_membership" "vendors" {
  name = "${aws_iam_group.limited_read_only.name}_vendors_membership"
  group = "${aws_iam_group.limited_read_only.name}"
  users = [
    "${aws_iam_user.tenableio.name}"
  ]
}
