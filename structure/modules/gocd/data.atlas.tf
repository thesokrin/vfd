# Atlas Kafka Module - Atlas Data Resources

data "terraform_remote_state" "environment" {
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

data "terraform_remote_state" "hub" {
  # WARNING: hub and environment may be the same, please use distinct() with lists
  backend = "s3"
  config {
    region = "${var.aws_region}"
    bucket = "isre.grindr.io"
    key    = "terraform/hubs/hub1/atlas.tfstate"
  }
}
