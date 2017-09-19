# Atlas Production Environment - Data Retention Resources - S3

resource "aws_s3_bucket"  "data_retention_s3" {
  bucket = "${var.name}.${var.zone}"

  acl = "private"

  tags {
    Name = "${var.name}"
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_project = "${var.project_name}"
    atlas_owner = "${var.project_owner}"
  }
}
