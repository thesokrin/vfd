# Atlas Module - Monkey Island

data "aws_caller_identity" "current" {}

module "monkey_island" {
  source = "../atlas_static_service"
  #inputs
  aws_region = "${var.aws_region}"
  name = "${var.project_name}"
  project_name = "${var.name}"
  ec2_instance_count = "${var.ec2_instance_count}"

  atlas_environment = "${var.env_name}"
}