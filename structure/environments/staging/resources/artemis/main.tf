# Atlas Staging Environment - Artemis Resources

provider "aws" {
  region = "${var.aws_region}"
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "artemis" {
  source = "../../../../modules/artemis"
  # config
  cidr_block      = "${data.terraform_remote_state.atlas.cidr_block}"
  hub_cidr_block  = "${var.hub_cidr_block}"
  lahq_cidr_block = "${var.lahq_cidr_block}"

  env_name       = "${var.env_name}"
  env_name_short = "${var.env_name_short}"
  env_name_fancy = "${var.env_name_fancy}"

  layer_dmz_cidr_blocks      = ["${data.terraform_remote_state.atlas.layer_dmz_cidr_blocks}"]
  layer_public_cidr_blocks   = ["${data.terraform_remote_state.atlas.layer_public_cidr_blocks}"]
  layer_services_cidr_blocks = ["${data.terraform_remote_state.atlas.layer_services_cidr_blocks}"]

  layer_public_subnet_ids = ["${data.terraform_remote_state.atlas.layer_public_subnet_ids}"]

  private_zone_id          = "${data.terraform_remote_state.atlas.private_zone_id}"
  vpc_id                   = "${data.terraform_remote_state.atlas.vpc_id}"
  wildcard_certificate_arn = "${data.terraform_remote_state.atlas.wildcard_certificate_arn}"
  zone                     = "${data.terraform_remote_state.atlas.zone}"

  realtime_elb_id = "${data.terraform_remote_state.atlas.realtime_elb_id}"
  web_elb_id      = "${data.terraform_remote_state.atlas.web_elb_id}"
  capacity = "${var.capacity}"
}
