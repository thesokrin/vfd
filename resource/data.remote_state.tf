# Atlas $_ENVIRONMENT Environment - $_DESCRIPTION - $_REMOTE_STATE Remote State

data "terraform_remote_state" "$_REMOTE_STATE" {
  # WARNING: hub and environment may be the same, please use distinct() with lists
  backend = "s3"
  config {
    region = "${var.aws_region}"
    bucket = "isre.grindr.io"
    # fetch right environment due to different hub path | also stop absolute pathing
    key    = "terraform/environments/${var.env_name}/resources/$_REMOTE_STATE.tfstate"
  }
}
