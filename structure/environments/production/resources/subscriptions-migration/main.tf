# Atlas Production - Subscriptions Migration Resources

provider "aws" {
  allowed_account_ids = ["${var.aws_account_id}"]
  region = "${var.aws_region}"
}

module "static-service" {
  source             = "../../../../modules/atlas_static_service"

  name               = "${var.name}"
  ec2_instance_count = "${var.instance_count}"
  ec2_instance_type  = "${var.ec2_instance_type}"
  role_package       = "${var.role_package}"

  atlas_environment  = "${var.atlas_environment}"
  project_name       = "${var.project_name}"
  project_owner      = "${var.project_owner}"

  vpc                = "${var.vpc}"
  subnet             = "${var.subnet}"
  cidr               = ["${var.cidr}"]
}
