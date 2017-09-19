# Atlas Production Environment - GoCD Resources - Atlas Data Resources

data "terraform_remote_state" "environment" {
  backend = "s3"
  config {
    region = "${var.aws_region}"
    bucket = "isre.grindr.io"
    # fetch right environment due to different hub path
    key    = "terraform/environments/${var.atlas_environment}/atlas.tfstate"
  }
}

data "terraform_remote_state" "hub" {
  backend = "s3"
  config {
    region = "${var.aws_region}"
    bucket = "isre.grindr.io"
    key    = "terraform/hubs/hub1/atlas.tfstate"
  }
}
