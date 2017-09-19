# Atlas Production - Recommendation Resources

provider "aws" {
  allowed_account_ids = ["${var.aws_account_id}"]
  region = "us-east-1"
}

module "recommendation" {
  source             = "../../../../modules/atlas_static_service"

  # variables
  atlas_environment  = "${var.atlas_environment}"

  name               = "recommendation"
  project_name       = "${var.project_name}"
  project_owner      = "${var.project_owner}"

  ec2_instance_count = 1
  ec2_instance_type  = "${var.ec2_instance_type}"
  vpc                = "${var.vpc}"
  subnet             = "${var.subnet}"
  cidr               = ["${var.cidr}"]
}

module "recommendation-airflow" {
  source             = "../../../../modules/atlas_static_service"

  # variables
  atlas_environment  = "${var.atlas_environment}"

  name               = "recommendation-airflow"
  project_name       = "${var.project_name}"
  project_owner      = "${var.project_owner}"

  ec2_instance_count = 1
  ec2_instance_type  = "${var.ec2_instance_type}"
  vpc                = "${var.vpc}"
  subnet             = "${var.subnet}"
  cidr               = ["${var.cidr}"]
}
