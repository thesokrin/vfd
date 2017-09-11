# Atlas Staging Environment - Aurora Cluster Resources

provider "aws" {
  # only allowed in us-east-1
  region = "${var.aws_region}"

  # only allowed in staging
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "aurora" {
  source = "../../../../modules/rds_cluster"

  # atlas specific inputs
  atlas_owner                = "${var.atlas_owner}"
  atlas_project              = "${var.atlas_project}"
  env_name                   = "${var.env_name}"
  env_name_fancy             = "${var.env_name_fancy}"
  env_name_short             = "${var.env_name_short}"
  layer_admin_cidr_blocks    = ["${var.layer_admin_cidr_blocks}"]
  layer_data_cidr_blocks     = ["${var.layer_data_cidr_blocks}"]
  layer_data_subnet_ids      = ["${var.layer_data_subnet_ids}"]
  layer_services_cidr_blocks = ["${var.layer_services_cidr_blocks}"]

  private_zone_id = "${var.private_zone_id}"

  vpc_id = "${var.vpc_id}"
  zone   = "${var.zone}"

  # main cluster inputs
  backup_retention_period = "${var.main_backup_retention_period}"
  cluster_id              = "${var.main_cluster_id}"
  password                = "${var.main_password}"
  skip_final_snapshot     = "${var.main_skip_final_snapshot}"
}
