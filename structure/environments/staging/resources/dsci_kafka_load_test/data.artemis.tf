# Atlas Development Environment - Data-Science Kafka Load Test Resources - Artemis Remote State

data "terraform_remote_state" "artemis" {
  # WARNING: hub and environment may be the same, please use distinct() with lists
  backend = "s3"
  config {
    region = "${var.aws_region}"
    bucket = "isre.grindr.io"
    # fetch right environment due to different hub path
    key    = "terraform/environments/${var.env_name}/resources/artemis.tfstate"
  }
}

