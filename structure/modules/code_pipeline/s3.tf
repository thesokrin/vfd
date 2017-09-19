# Code Pipeline - Resources

resource "aws_s3_bucket"  "default" {
  bucket = "code-pipeline-${var.name}.${var.zone}"

  acl = "private"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    prefix  = "${var.lifecycle_rule_prefix}"
    enabled = true

    expiration {
      days = 30
    }
  }

  tags {
    Name = "${var.name}"
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_project = "${var.project_name}"
    atlas_owner = "${var.project_owner}"
  }
}

data "template_file" "bucket_policy" {
  template = "${file("${path.module}/templates/s3/bucket-policy.json.tpl")}"

  vars {
    bucket_name = "${aws_s3_bucket.default.bucket}"
    account_id = "${data.aws_caller_identity.current.account_id}"
  }
}

resource "aws_s3_bucket_policy" "default" {
  bucket = "${aws_s3_bucket.default.bucket}"
  policy = "${data.template_file.bucket_policy.rendered}"
}

resource "aws_s3_bucket_object" "source_location" {
  bucket = "${aws_s3_bucket.default.bucket}"
  acl = "private"
  key = "source/"
  source = "/dev/null"
}

resource "aws_s3_bucket_object" "lambda_location" {
  bucket = "${aws_s3_bucket.default.bucket}"
  acl = "private"
  key = "deploy/"
  source = "/dev/null"
}
