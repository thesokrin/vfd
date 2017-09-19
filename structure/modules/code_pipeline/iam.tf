# Code Pipeline Module - IAM Resources

# Storage IAM User, Group, and Policy
resource "aws_iam_user" "storage_manager" {
  name = "atlas_${var.env_name}_${replace(var.name, "-", "_")}_code_pipeline_storage_manager"
}

resource "aws_iam_group" "storage_group" {
  name = "atlas_${var.env_name}_${replace(var.name, "-", "_")}_code_pipeline_storage_group"
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
    source_folder = "${aws_s3_bucket_object.source_location.key}"
    name = "${replace(var.name, "-", "")}"
  }
}

resource "aws_iam_policy" "storage" {
  name = "atlas_${var.env_name}_${replace(var.name, "-", "_")}_code_pipeline_storage_manager"
  description = "Allows read-write permissions to the code pipeline storage bucket for ${var.name}.${var.zone}"
  policy = "${data.template_file.storage_policy.rendered}"
}

resource "aws_iam_policy_attachment" "storage" {
  name = "${aws_iam_policy.storage.name}_attachment"
  groups = ["${aws_iam_group.storage_group.name}"]
  policy_arn = "${aws_iam_policy.storage.arn}"
}

# Pipeline IAM Role Policy
data "template_file" "code_pipeline_policy" {
  template = "${file("${path.module}/templates/iam/code-pipeline-policy.json.tpl")}"

  vars {
    bucket_arn = "${aws_s3_bucket.default.arn}"
  }
}

resource "aws_iam_policy" "code_pipeline_policy" {
  name = "atlas_${var.env_name}_${replace(var.name, "-", "_")}_code_pipeline_policy"
  description = "Allows access to get items from the s3 bucket and run pipeline actions"
  policy = "${data.template_file.code_pipeline_policy.rendered}"
}

# Pipeline IAM Role
data "template_file" "code_pipeline_assume_policy" {
  template = "${file("${path.module}/templates/iam/code-pipeline-assume-policy.json.tpl")}"
}

resource "aws_iam_role" "code_pipeline_role" {
  name = "atlas_${var.env_name}_${replace(var.name, "-", "_")}_code_pipeline_role"
  assume_role_policy = "${data.template_file.code_pipeline_assume_policy.rendered}"
}

resource "aws_iam_policy_attachment" "code_pipeline_role_attachment" {
  name = "${aws_iam_role.code_pipeline_role.name}_attachment"
  roles = [
    "${aws_iam_role.code_pipeline_role.name}"
  ]
  policy_arn = "${aws_iam_policy.code_pipeline_policy.arn}"
}

# Lambda IAM Role
resource "aws_iam_role" "code_pipeline_lambda_role" {
  name = "atlas_${var.env_name}_${replace(var.name, "-", "_")}_code_pipeline_lambda_role"
  path = "/lambda/"
  assume_role_policy = "${data.template_file.code_pipeline_lambda_assume_policy.rendered}"
}

resource "aws_iam_policy" "code_pipeline_lambda_policy" {
  name = "atlas_${var.env_name}_${replace(var.name, "-", "_")}_code_pipeline_lambda_policy"
  description = "${var.name} policy for the current account."
  policy = "${data.template_file.code_pipeline_lambda_policy.rendered}"
}

resource "aws_iam_policy_attachment" "code_pipeline_lambda_attachment" {
  name = "${aws_iam_role.code_pipeline_lambda_role.name}_attachment"
  roles = [
    "${aws_iam_role.code_pipeline_lambda_role.name}"
  ]
  policy_arn = "${aws_iam_policy.code_pipeline_lambda_policy.arn}"
}

data "template_file" "code_pipeline_lambda_assume_policy" {
  template = "${file("${path.module}/templates/iam/code-pipeline-lambda-assume-policy.json.tpl")}"
  vars {
    name = "${replace(var.name, "-", "")}"
  }
}

data "template_file" "code_pipeline_lambda_policy" {
  template = "${file("${path.module}/templates/iam/code-pipeline-lambda-policy.json.tpl")}"
  vars {
    name = "${replace(var.name, "-", "")}"
    aws_account_id = "${data.aws_caller_identity.current.account_id}"
    bucket_arn = "${aws_s3_bucket.default.arn}"
    lambda_folder = "${aws_s3_bucket_object.lambda_location.key}"
    pipeline_bucket_arn = "arn:aws:s3:::codepipeline-us-east-1-648245246327"

  }
}
