# Atlas Staging Environment - RabbitMQ Resources

provider "aws" {
  region = "us-east-1"
  # only allowed in staging
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "rabbitmq" {
  source = "../../../../modules/rabbitmq"
  # inputs
  env_name = "${var.env_name}"
  env_name_short = "${var.env_name_short}"
  env_name_fancy = "${var.env_name_fancy}"

  cidr_block = "${var.cidr_block}"
  layer_data_subnet_ids = ["${var.layer_data_subnet_ids}"]
  layer_data_cidr_blocks = ["${var.layer_data_cidr_blocks}"]
  layer_services_cidr_blocks = ["${var.layer_services_cidr_blocks}"]
  layer_admin_cidr_blocks = ["${var.layer_admin_cidr_blocks}"]
  instance_count = "${var.instance_count}"
  private_zone_id = "${var.private_zone_id}"
  reverse_zone_id = "${var.reverse_zone_id}"
  vpc_id = "${var.vpc_id}"
  zone = "${var.zone}"

}
