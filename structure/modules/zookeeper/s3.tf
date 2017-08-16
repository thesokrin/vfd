# Atlas Zookeeper Module - S3

resource "aws_s3_bucket" "exhibitor" {
  bucket = "${var.name}.${var.zone}"
  force_destroy = "${var.env_name_short == "stg"}"

  versioning {
    enabled = true
  }

  tags {
    Name = "${var.name}.${var.zone}"

    # atlas resources
    atlas_environment = "${var.env_name}"
    atlas_layer       = "admin"
    atlas_project     = "${var.project_name}"
    atlas_owner       = "${var.project_owner}"
    atlas_role        = "exhibitor"
    atlas_zone        = "${var.zone}"
  }
}
