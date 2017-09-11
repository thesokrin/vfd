# Atlas Development Environment - Manager Resources

provider "aws" {
  # only allowed in us-east-1
  region = "us-east-1"
  # only allowed in preprod
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "manager" {
  source = "../../../../modules/atlas_manager"
  # inputs
  layer_dmz_cidr_blocks = ["${var.layer_dmz_cidr_blocks}"]
  layer_dmz_subnet_ids = ["${var.layer_dmz_subnet_ids}"]
  stack_name = "${var.env_name}"
  stack_name_fancy = "${var.env_name_fancy}"
  stack_name_short = "${var.env_name_short}"
  public_zone_id = "${var.public_zone_id}"
  private_zone_id = "${var.private_zone_id}"
  reverse_zone_id = "${var.reverse_zone_id}"
  vpc_id = "${var.vpc_id}"
  zone = "${var.zone}"
}
