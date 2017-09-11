# Atlas Hub - Monkeyisland resources

provider "aws" {
  region = "${var.aws_region}"
  # only allowed in 2.0
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "monkeyisland" {
  source = "../../../../modules/atlas_static_service"

  #inputs
  aws_region = "${var.aws_region}"
  name = "monkeyisland"
  project_name = "monkeyisland"
  ec2_instance_count = "${var.ec2_instance_count}"

  zone = "hub.grindr.io"

  private_zone_id = "Z1RCUXX7W0A26O"
  reverse_zone_id = "Z3DN439AXT68NJ"
  vpc_id = "${var.vpc_id}"

  lahq_cidr_block = "${var.lahq_cidr_block}"
  hub_cidr_block = "${var.cidr_block}"
  cidr_block = "${var.cidr_block}"

  layer_admin_cidr_blocks = ["${var.layer_admin_cidr_blocks}"]
  layer_services_cidr_blocks = ["${var.layer_services_cidr_blocks}"]
  layer_services_subnet_ids = ["${var.layer_services_subnet_ids}"]
  layer_public_cidr_blocks = ["${var.layer_public_cidr_blocks}"]

  env_name = "${var.env_name}"
  env_name_short = "${var.env_name_short}"
  env_name_fancy = "${var.env_name_fancy}"

}
