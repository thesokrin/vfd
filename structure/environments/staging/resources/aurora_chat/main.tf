# Atlas Staging Environment - Chat Aurora Cluster Resources

provider "aws" {
  # only allowed in us-east-1
  region = "${var.aws_region}"

  # only allowed in staging
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "aurora_chat" {
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
  additional_aurora_cidr_blocks = ["${var.additional_aurora_cidr_blocks}"]
  private_zone_id = "${var.private_zone_id}"

  vpc_id = "${var.vpc_id}"
  zone   = "${var.zone}"

  # chat cluster inputs
  backup_retention_period = "${var.chat_backup_retention_period}"
  cluster_id              = "${var.chat_cluster_id}"
  password                = "${var.chat_password}"
  skip_final_snapshot     = "${var.chat_skip_final_snapshot}"
  masters_instance_count  = "${var.chat_masters_instance_count}"
  slaves_instance_count   = "${var.chat_slaves_instance_count}"
  reporting_instance      = "${var.chat_reporting_instance}"
  instance_class_master   = "${var.chat_instance_class_master}"
  instance_class_slave    = "${var.chat_instance_class_slave}"
}
