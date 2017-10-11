# Atlas Staging Environment - Redis Resources

provider "aws" {
  region = "us-east-1"

  # only allowed in staging
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "redis" {
  source = "../../../../modules/redis_cluster"

  # inputs
  replica_count_per_primary   = "${var.replica_count_per_primary}"
  cidr_block                 = "${var.env_cidr_block}"
  env_name                   = "${var.env_name}"
  env_name_fancy             = "${var.env_name_fancy}"
  env_name_short             = "${var.env_name_short}"
  layer_admin_cidr_blocks    = ["${var.layer_admin_cidr_blocks}"]
  layer_data_cidr_blocks     = ["${var.layer_data_cidr_blocks}"]
  layer_data_subnet_ids      = ["${var.layer_data_subnet_ids}"]
  layer_services_cidr_blocks = ["${var.layer_services_cidr_blocks}"]
  additional_cidr_blocks     = ["${var.additional_cidr_blocks}"]
  private_zone_id            = "${var.private_zone_id}"
  reverse_zone_id            = "${var.reverse_zone_id}"
  vpc_id                     = "${var.vpc_id}"
  zone                       = "${var.zone}"

  primary_instance_type = "${var.ec2_instance_type}"
  replica_instance_type = "${var.ec2_instance_type}"
}
