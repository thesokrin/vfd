# Atlas PreProd - SonarQube resource

data "aws_caller_identity" "current" {}

provider "aws" {
  region = "${var.aws_region}"
  # only allowed in 2.0
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "sonar-backend" {
  source = "../../../../modules/atlas_static_service"

  #inputs
  aws_region = "${var.aws_region}"
  name = "${var.name}"
  project_name = "sonar-backend"
  ec2_instance_count = "${var.ec2_instance_count}"
  atlas_environment = "${var.env_name}"

}
