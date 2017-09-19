# Atlas Production Environment - Presence Resources

provider "aws" {
  region = "${var.aws_region}"
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "presence" {
  source = "../../../../modules/chat_presence"
  # configuration
  ec2_instance_type = "${var.ec2_instance_type}"

  env_cidr_block = "${var.env_cidr_block}"
  env_name = "${var.env_name}"
  env_name_fancy = "${var.env_name_fancy}"
  env_name_short = "${var.env_name_short}"

  hub_cidr_block = "${var.hub_cidr_block}"
  lahq_cidr_block = "${var.lahq_cidr_block}"

  layer_dmz_cidr_blocks = ["${var.layer_dmz_cidr_blocks}"]
  layer_dmz_subnet_ids = ["${var.layer_dmz_subnet_ids}"]
  layer_public_cidr_blocks = ["${var.layer_public_cidr_blocks}"]
  layer_services_cidr_blocks = ["${var.layer_services_cidr_blocks}"]
  layer_services_subnet_ids = ["${var.layer_services_subnet_ids}"]

  presence_auth_host = "${var.presence_auth_host}"

  private_zone_id = "${var.private_zone_id}"
  public_zone_id = "${var.public_zone_id}"
  reverse_zone_id = "${var.reverse_zone_id}"

  vpc_id = "${var.vpc_id}"

  wildcard_certificate_arn = "${var.wildcard_certificate_arn}"

  zone = "${var.zone}"
}
