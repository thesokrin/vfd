# Atlas Data-Science Environment - DC/OS Masters

provider "aws" {
  # only allowed in us-east-1
  region = "${var.aws_region}"

  # only allowed in one fixed AWS account
  allowed_account_ids = ["${var.aws_account_id}"]
}

data "aws_region" "current" {
  current = true
}

module "dcos_masters" {
  source = "../../../../modules/atlas_dcos_masters"

  # inputs
  cidr_block                 = "${var.cidr_block}"
  dash_elb_id                = "${var.dash_elb_id}"
  layer_admin_cidr_blocks    = ["${var.layer_admin_cidr_blocks}"]
  layer_admin_subnet_ids     = ["${var.layer_admin_subnet_ids}"]
  layer_dmz_cidr_blocks      = ["${var.layer_dmz_cidr_blocks}"]
  layer_public_cidr_blocks   = ["${var.layer_public_cidr_blocks}"]
  layer_services_cidr_blocks = ["${var.layer_services_cidr_blocks}"]
  private_zone_id            = "${var.private_zone_id}"
  reverse_zone_id            = "${var.reverse_zone_id}"
  stack_id                   = "${var.env_id}"
  stack_name                 = "${var.env_name}"
  stack_name_fancy           = "${var.env_name_fancy}"
  stack_name_short           = "${var.env_name_short}"
  stack_region               = "${data.aws_region.current.name}"
  vpc_id                     = "${var.vpc_id}"
  zone                       = "${var.zone}"
}
