# Atlas Data-Science Environment - Collect Resources

provider "aws" {
  region = "us-east-1"
  # only allowed in 3.0
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "collect" {
  source = "../../../../modules/atlas_collect"
  # inputs
  stack_name = "${var.env_name}"
  stack_name_short = "${var.env_name_short}"
  stack_name_fancy = "${var.env_name_fancy}"

  cidr_block = "${var.cidr_block}"
  layer_admin_subnet_ids = ["${var.layer_admin_subnet_ids}"]
  private_zone_id = "${var.private_zone_id}"
  reverse_zone_id = "${var.reverse_zone_id}"
  vpc_id = "${var.vpc_id}"
  zone = "${var.zone}"

  # destinations
  metrics_destination = "${var.metrics_destination}"
  logs_destination = "${var.logs_destination}"
}
