# Atlas Hub - Artemis Resources

provider "aws" {
  # only allowed in us-east-1
  region = "${var.aws_region}"
  # only allowed in 2.0
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "artemis" {
  source = "../../../../modules/atlas_artemis"

  # config
  cidr_block                 = "${var.cidr_block}"
  hub_cidr_block             = "${var.hub_cidr_block}"
  lahq_cidr_block            = "${var.lahq_cidr_block}"

  env_name                   = "${var.env_name}"
  env_name_short             = "${var.env_name_short}"
  env_name_fancy             = "${var.env_name_fancy}"

  layer_dmz_cidr_blocks      = ["${var.layer_dmz_cidr_blocks}"]
  layer_public_cidr_blocks   = ["${var.layer_public_cidr_blocks}"]
  layer_services_cidr_blocks = ["${var.layer_services_cidr_blocks}"]
  layer_public_subnet_ids    = ["${var.layer_public_subnet_ids}"]

  private_zone_id            = "${var.private_zone_id}"
  vpc_id                     = "${var.vpc_id}"
  zone                       = "${var.zone}"

  rt_elb_id                  = "${var.realtime_elb_id}"
  web_elb_id                 = "${var.web_elb_id}"
  ec2_ami_id                 = "${var.ec2_ami_id}"
  capacity                   = "${var.asg_capacity}"
}
