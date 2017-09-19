# Atlas Development Environment - Atlas Resources

provider "aws" {
  # only allowed in us-east-1
  region = "us-east-1"
  # only allowed in preprod
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "environment" {
  source = "../../../modules/atlas_environment"
  id = "${var.env_id}"
  name = "${var.env_name}"
  name_short = "${var.env_name_short}"
  name_fancy = "${var.env_name_fancy}"

  hub_account_id = "${var.hub_account_id}"
  hub_cidr_block = "${var.hub_cidr_block}"
  hub_vpc_id = "${var.hub_vpc_id}"
  hub_zone = "${var.hub_zone}"
}

module "nat_gateway" {
  source = "../../../modules/atlas_nat_gateway"
  # variables
  zone = "${module.environment.zone}"
  dmz_subnet_ids = ["${module.environment.public_subnet_ids}"]
  # inject routes into all private route tables
  private_route_table_ids = ["${module.environment.private_route_table_ids}"]
}

# additional bolt-on layer for chat
module "layer_chat" {
  source = "../../../macros/layer_chat"
  # variables
  cidr_block = "${module.environment.cidr_block}"
  hub_cidr_block = "${var.hub_cidr_block}"
  nat_gateway_ids = ["${module.nat_gateway.nat_gateway_ids}"]
  vpc_id = "${module.environment.vpc_id}"
  vpc_peering_connection_id = "${module.environment.vpc_peering_connection_id}"
  zone = "${module.environment.zone}"
}

# additional bolt-on layer for legacy
module "layer_legacy" {
  source = "../../../macros/layer_legacy"
  # variables
  cidr_block = "${module.environment.cidr_block}"
  hub_cidr_block = "${var.hub_cidr_block}"
  nat_gateway_ids = ["${module.nat_gateway.nat_gateway_ids}"]
  vpc_id = "${module.environment.vpc_id}"
  vpc_peering_connection_id = "${module.environment.vpc_peering_connection_id}"
  zone = "${module.environment.zone}"
}

# load balancers in the dmz
module "dmz_elbs" {
  source = "../../../modules/atlas_dmz_elbs"
  # variables
  env_name             = "${module.environment.name}"
  env_name_fancy       = "${module.environment.name_fancy}"
  env_name_short       = "${module.environment.name_short}"

  certificate_arn      = "${var.wildcard_certificate_arn}"
  layer_dmz_subnet_ids = ["${module.environment.layer_dmz_subnet_ids}"]
  public_zone_id       = "${module.environment.public_zone_id}"
  vpc_id               = "${module.environment.vpc_id}"
  zone                 = "${module.environment.zone}"
}
