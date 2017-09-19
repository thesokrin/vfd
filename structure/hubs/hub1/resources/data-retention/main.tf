# Atlas Hub - Data Retention Resources

provider "aws" {
  allowed_account_ids = ["${var.aws_account_id}"]
  region = "us-east-1"
}

module "service" {
  source             = "../../../../modules/atlas_static_service"

  # variables
  atlas_environment  = "${var.atlas_environment}"

  name               = "data-retention"
  project_name       = "${var.project_name}"
  project_owner      = "${var.project_owner}"

  ec2_instance_count = 1
  ec2_instance_type  = "${var.ec2_instance_type}"
  role_package       = "grindr-java"
}
