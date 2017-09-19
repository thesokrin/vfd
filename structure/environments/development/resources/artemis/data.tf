# Atlas Development Environment - Artemis Resources - Data

data "terraform_remote_state" "atlas" {
  backend = "s3"
  config {
    region = "${var.aws_region}"
    bucket = "isre.grindr.io"
    # fetch right environment due to different hub path
    key    = "terraform/${
      var.env_name == "hub" ?
        "hubs/hub1/atlas.tfstate"
      :
        "environments/${var.env_name}/atlas.tfstate"
    }"
  }
}
