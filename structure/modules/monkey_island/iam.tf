# Atlas PreProd - Monkey Island resource - IAM Resources

# Storage IAM User, Group, and Policy
resource "aws_iam_user" "storage_manager" {
  name = "atlas_${var.env_name}_${replace(var.name, "-", "_")}_monkey_island_storage_manager"
}

resource "aws_iam_group" "storage_group" {
  name = "atlas_${var.env_name}_${replace(var.name, "-", "_")}_monkey_island_storage_group"
}

resource "aws_iam_group_membership" "storage_membership" {
  name = "${aws_iam_group.storage_group.name}_membership"
  group = "${aws_iam_group.storage_group.name}"
  users = [
    "${aws_iam_user.storage_manager.name}"
  ]
}

data "template_file" "storage_policy" {
  template = "${file("${path.module}/templates/iam/storage-manager-policy.json.tpl")}"

  vars {
    aws_account_id = "${data.aws_caller_identity.current.account_id}"
    bucket_arn = "${aws_s3_bucket.default.arn}"
    name = "${replace(var.name, "-", "")}"
  }
}

resource "aws_iam_policy" "storage" {
  name = "atlas_${var.env_name}_${replace(var.name, "-", "_")}_monkey_island_storage_manager"
  description = "Allows read-write permissions to the monkey_island storage bucket for ${var.name}.${var.zone}"
  policy = "${data.template_file.storage_policy.rendered}"
}

resource "aws_iam_policy_attachment" "storage" {
  name = "${aws_iam_policy.storage.name}_attachment"
  groups = ["${aws_iam_group.storage_group.name}"]
  policy_arn = "${aws_iam_policy.storage.arn}"
}