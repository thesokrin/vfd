# Atlas CDN - S3 Resources

resource "aws_s3_bucket"  "default" {
  bucket = "cdn.${var.zone}"

  acl = "public-read"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = [
      "*"
    ]
    max_age_seconds = 3600
  }

  tags {
    Name = "cdn.${var.env_name_short}"
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_project = "${var.project_name}"
    atlas_owner = "${var.project_owner}"
  }
}

data "template_file" "bucket_policy" {
  template = "${file("${path.module}/templates/bucket-policy.json.tpl")}"

  vars {
    bucket_name = "${aws_s3_bucket.default.bucket}"
    account_id = "${data.aws_caller_identity.current.account_id}"
  }
}

resource "aws_s3_bucket_policy" "default" {
  bucket = "${aws_s3_bucket.default.bucket}"
  policy = "${data.template_file.bucket_policy.rendered}"
}
