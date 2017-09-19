# Atlas Production - GoCD Resources

provider "aws" {
  allowed_account_ids = ["${var.aws_account_id}"]
  region = "us-east-1"
}

# agent cluster
module "gocd_agent" {
  source             = "../../../../modules/atlas_static_service"

  # variables
  atlas_environment  = "${var.atlas_environment}"

  name               = "gocd-agent"
  project_name       = "${var.project_name}"
  project_owner      = "${var.project_owner}"
  role_package       = "grindr-gocd-agent"

  ec2_instance_count = 1
  ec2_instance_type  = "${var.ec2_instance_type}"
}
