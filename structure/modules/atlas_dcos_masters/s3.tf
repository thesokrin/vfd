# Atlas DC/OS Masters Module - S3

resource "aws_s3_bucket" "exhibitor" {
  bucket = "exhibitor.${var.zone}"

  versioning {
    enabled = true
  }

  tags {
    Name = "exhibitor.${var.zone}"

    # atlas resources
    atlas_environment = "${var.stack_name}"
    atlas_layer       = "admin"
    atlas_owner       = "isre"
    atlas_project     = "dcos_masters"
    atlas_role        = "exhibitor"
    atlas_zone        = "${var.zone}"
  }
}
