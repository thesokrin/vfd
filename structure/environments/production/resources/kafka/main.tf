# Atlas Data-Science Environment - Kafka Resources

provider "aws" {
  region = "${var.aws_region}"

  # only allowed in one fixed AWS account
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "kafka" {
  source = "../../../../modules/kafka"

  # inputs
  name                       = "${var.name}"
  project_name               = "${var.project_name}"
  role_package               = "${var.role_package}"
  ec2_instance_count         = "${var.ec2_instance_count}"
  ec2_instance_type          = "${var.ec2_instance_type}"

  env_name                   = "${var.env_name}"
  env_name_short             = "${var.env_name_short}"
  env_name_fancy             = "${var.env_name_fancy}"

  artemis_sg_id                  = "${var.artemis_sg_id}"
  additional_kafka_cidr_blocks   = "${var.additional_kafka_cidr_blocks}"
  additional_manager_cidr_blocks = "${var.additional_manager_cidr_blocks}"
  cidr_block                     = "${var.cidr_block}"
  layer_data_subnet_ids          = ["${var.layer_data_subnet_ids}"]
  layer_data_cidr_blocks         = ["${var.layer_data_cidr_blocks}"]
  layer_services_cidr_blocks     = ["${var.layer_services_cidr_blocks}"]
  layer_admin_cidr_blocks        = ["${var.layer_admin_cidr_blocks}"]
  private_zone_id                = "${var.private_zone_id}"
  reverse_zone_id                = "${var.reverse_zone_id}"
  vpc_id                         = "${var.vpc_id}"
  zone                           = "${var.zone}"
}
