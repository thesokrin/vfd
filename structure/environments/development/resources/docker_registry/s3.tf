# Atlas Development Environment - Docker Registry Resources - S3

resource "aws_s3_bucket" "repo" {
  bucket = "registry.${var.zone}"

  tags {
    Name = "registry.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_project = "docker_registry"
    atlas_owner = "isre"
  }
}
