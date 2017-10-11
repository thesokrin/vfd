# Atlas Production Environment - Zookeeper Resources

provider "aws" {
  region = "${var.aws_region}"
  # only allowed in production
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "zookeeper" {
  source = "../../../../modules/zookeeper"
  # inputs
  additional_exhibitor_cidr_blocks = ["${var.additional_exhibitor_cidr_blocks}"]
  additional_zookeeper_cidr_blocks = ["${var.additional_zookeeper_cidr_blocks}"]
  artemis_sg_id                    = "${var.artemis_sg_id}"
  cidr_block                       = "${var.cidr_block}"
  env_name                         = "${var.env_name}"
  env_name_fancy                   = "${var.env_name_fancy}"
  env_name_short                   = "${var.env_name_short}"
  layer_admin_cidr_blocks          = ["${var.layer_admin_cidr_blocks}"]
  layer_data_cidr_blocks           = ["${var.layer_data_cidr_blocks}"]
  layer_admin_subnet_ids           = ["${var.layer_admin_subnet_ids}"]
  layer_services_cidr_blocks       = ["${var.layer_services_cidr_blocks}"]
  private_zone_id                  = "${var.private_zone_id}"
  reverse_zone_id                  = "${var.reverse_zone_id}"
  vpc_id                           = "${var.vpc_id}"
  zone                             = "${var.zone}"
}
