# Atlas $_ENVIRONMENT Environment - $_FANCY_NAME

module "$_MODULE" {
  source = "../../../../modules/$_MODULE"

  # variables
  atlas_environment  = "${var.env_name}"

  # inputs
  name                       = "${var.name}"
  project_name               = "${var.project_name}"
  #project_owner              = "${var.project_owner}"

  #ec2_iam_role               = "${aws_iam_role.default.name}"
  aws_region                 = "${var.aws_region}"
  project_name               = "${var.project_name}"
  role_package               = "${var.$_NAME_role_package}"
  ec2_instance_count         = "${var.$_NAME_instance_count}"
  ec2_instance_type          = "${var.$_NAME_instance_type}"

  #additional_$_NAME_cidr_blocks   = "${var.additional_$_NAME_cidr_blocks}"
  #additional_manager_security_group_ids = [
  #  "${data.terraform_remote_state.$_NAME.security_group_id}"
  #]
}
