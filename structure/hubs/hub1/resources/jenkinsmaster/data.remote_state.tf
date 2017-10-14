# Atlas hub Environment - Jenkins Master - atlas Remote State

data "terraform_remote_state" "atlas" {
  # WARNING: hub and environment may be the same, please use distinct() with lists
  backend = "s3"
  config {
    region = "${var.aws_region}"
    bucket = "isre.grindr.io"
    # fetch right environment due to different hub path | also stop absolute pathing
    key    = "terraform/environments/${var.env_name}/resources/atlas.tfstate"
  }
}
