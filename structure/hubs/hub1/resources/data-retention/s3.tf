# Atlas Hub - Data Retention Resources - S3

resource "aws_s3_bucket"  "chat_image_archive" {
  bucket = "${var.bucket_name}.${data.terraform_remote_state.hub.zone}"

  tags {
    Name              = "${var.bucket_name}.${data.terraform_remote_state.hub.zone}"
    atlas_zone        = "${data.terraform_remote_state.hub.zone}"
    atlas_environment = "${data.terraform_remote_state.hub.env_name}"
    atlas_project     = "${var.project_name}"
    atlas_owner       = "${var.project_owner}"
  }
}
