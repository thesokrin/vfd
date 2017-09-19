# Atlas PreProd - Monkey Island resource

resource "aws_s3_bucket"  "default" {
  bucket = "bucket-${var.name}.${var.zone}"

  acl = "private"

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