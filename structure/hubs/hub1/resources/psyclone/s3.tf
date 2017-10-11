# Atlas Hub - Psyclone Resources - S3

resource "aws_s3_bucket"  "default" {
  bucket = "${var.bucket_name}.${data.terraform_remote_state.environment.zone}"

  tags {
    Name              = "${var.bucket_name}.${data.terraform_remote_state.environment.zone}"
    atlas_zone        = "${data.terraform_remote_state.environment.zone}"
    atlas_environment = "${data.terraform_remote_state.environment.env_name}"
    atlas_project     = "${var.project_name}"
    atlas_owner       = "${var.project_owner}"
  }
}
