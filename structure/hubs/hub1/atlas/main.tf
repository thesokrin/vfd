# Atlas Hub 1 - Atlas Resources

provider "aws" {
  # can only be run in us-east-1 under the grindr 2.0 account
  region = "us-east-1"
  allowed_account_ids = ["${var.aws_account_id}"]
}

#  modules
module "hub" {
  source = "../../../modules/atlas_hub"
  # variables
  id = "${var.env_id}"
  name = "${var.env_name}"
  name_short = "${var.env_name_short}"
  name_fancy = "${var.env_name_fancy}"
}

module "nat_gateway" {
  source = "../../../modules/atlas_nat_gateway"
  # variables
  zone = "${module.hub.zone}"
  dmz_subnet_ids = ["${module.hub.public_subnet_ids}"]
  private_route_table_ids = ["${module.hub.private_route_table_ids}"]
}

module "vpn" {
  source = "../../../modules/atlas_vpn"
  # variables
  vpc_id = "${module.hub.vpc_id}"
  zone = "${module.hub.zone}"
  vpn_destination = "206.121.69.46"
  bgp_asn = 65000
  vpn_cidr_block = "10.40.0.0/21"
  route_table_ids = ["${module.hub.private_route_table_ids}"]
}

module "dmz_elbs" {
  source = "../../../modules/atlas_dmz_elbs"
  # variables
  env_name             = "${module.hub.name}"
  env_name_fancy       = "${module.hub.name_fancy}"
  env_name_short       = "${module.hub.name_short}"

  certificate_arn      = "${var.wildcard_certificate_arn}"
  layer_dmz_subnet_ids = ["${module.hub.layer_dmz_subnet_ids}"]
  public_zone_id       = "${module.hub.public_zone_id}"
  vpc_id               = "${module.hub.vpc_id}"
  zone                 = "${module.hub.zone}"
}
