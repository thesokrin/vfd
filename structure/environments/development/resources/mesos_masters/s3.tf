# Atlas Development Environment - Mesos Masters S3 Resources

resource "aws_s3_bucket" "exhibitor" {
  bucket = "exhibitor.${var.zone}"

  versioning {
    enabled = true
  }

  tags {
    Name = "exhibitor.${var.zone}"
    # atlas resources
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "admin"
    atlas_project = "mesos_masters"
    atlas_role = "exhibitor"
    atlas_owner = "isre"
  }
}
