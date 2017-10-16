# Atlas $_ENVIRONMENT - $_FANCY_NAME

provider "aws" {
  allowed_account_ids = ["${var.aws_account_id}"]
  region = "${var.aws_region}"
}

module "${var.module}" {
  source             = "../../../../modules/${var.module}"

  # variables
  atlas_environment  = "${var.atlas_environment}"

  name               = "${var.project_name}"
  project_name       = "${var.project_name}"
  project_owner       = "${var.project_owner}"
  ec2_instance_count = "${var.ec2_instance_count}"
  ec2_instance_type  = "${var.ec2_instance_type}"
}
