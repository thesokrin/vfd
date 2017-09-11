# Atlas Data-Science Environment - Datalake Resources - S3

resource "aws_s3_bucket"  "default" {
  bucket = "${var.name}.${var.zone}"

  acl = "private"

  lifecycle_rule {
    prefix = "archive/"
    enabled = true

    expiration {
      days = "730"
    }
  }

  lifecycle_rule {
    prefix = "etl/"
    enabled = true

    expiration {
      days = "60"
    }
  }

  tags {
    Name = "${var.name}.${var.zone}"
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_project = "${var.name}"
    atlas_owner = "${var.project_owner}"
  }
}

resource "aws_s3_bucket_object" "archive" {
  bucket = "${aws_s3_bucket.default.bucket}"
  key = "archive/"
  acl = "private"
  source = "/dev/null"
}

resource "aws_s3_bucket_object" "etl" {
  bucket = "${aws_s3_bucket.default.bucket}"
  key = "etl/"
  acl = "private"
  source = "/dev/null"
}

data "template_file" "bucket_policy" {
  template = "${file("${path.module}/templates/bucket-policy.json.tpl")}"

  vars {
    bucket_name = "${aws_s3_bucket.default.bucket}"
    archive_folder_name = "${aws_s3_bucket_object.archive.id}"
    account_id = "${var.aws_account_id}"
  }
}

resource "aws_s3_bucket_policy" "default" {
  bucket = "${aws_s3_bucket.default.bucket}"
  policy = "${data.template_file.bucket_policy.rendered}"
}
