# Atlas Production - GoCD Resources

provider "aws" {
  allowed_account_ids = ["${var.aws_account_id}"]
  region = "us-east-1"
}

module "gocd_server" {
  source             = "../../../../modules/atlas_static_service"

  # variables
  atlas_environment  = "${var.atlas_environment}"

  name               = "gocd-master"
  project_name       = "${var.project_name}"
  project_owner      = "${var.project_owner}"

  ec2_iam_role       = "${aws_iam_role.master.name}"
  ec2_instance_count = 1
  ec2_instance_type  = "${var.ec2_instance_type}"
}
