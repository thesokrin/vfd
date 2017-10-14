# Atlas $_ENVIRONMENT - $_FANCY_NAME

provider "aws" {
  allowed_account_ids = ["${var.aws_account_id}"]
  region = "${var.aws_region}"
}

module "$_MODULE" {
  source             = "../../../../modules/$_MODULE"

  # variables
  atlas_environment  = "${var.atlas_environment}"

  name               = "$_NAME"
  project_name       = "${var.project_name}"
  project_owner      = "${var.project_owner}"

  ec2_instance_count = "${var.ec2_instance_count}"
  ec2_instance_type  = "${var.ec2_instance_type}"
  ec2_iam_role       = "${var.ec2_iam_role}"

  #vpc                = "${var.vpc}"
  #subnet             = "${var.subnet}"
  #cidr               = ["${var.cidr}"]
}

#resource "aws_iam_policy" "policy" {
#  name        = "$_NAME"
#  description = "Policy for $_FANCY_NAME"
#  policy      = "${file("$_NAME.json")}"
#}
