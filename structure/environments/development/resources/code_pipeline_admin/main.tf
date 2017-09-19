# Atlas Development Environment - Code Pipeline Admin Resources

provider "aws" {
  region = "${var.aws_region}"
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "code_pipeline" {
  source = "../../../../modules/code_pipeline"

  # variables
  name = "admin"
  project_name = "admin"
  project_owner = "authenticity"
  env_name = "${var.env_name}"
  zone = "${var.zone}"
  expected_deploy_file = "admin.war"
}
