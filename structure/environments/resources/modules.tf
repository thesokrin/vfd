# Atlas Development Environment - Data-Science $_FANCY_NAME Load Test Resources - $_FANCY_NAME

module "$_NAME" {
  source = "../../../../modules/$_NAME"

  # inputs
  name                       = "${var.name}"
  aws_region                 = "${var.aws_region}"
  env_name                   = "${var.env_name}"
  project_name               = "${var.project_name}"
  role_package               = "${var.$_NAME_role_package}"
  ec2_instance_count         = "${var.$_NAME_instance_count}"
  ec2_instance_type          = "${var.$_NAME_instance_type}"

  additional_$_NAME_cidr_blocks   = "${var.additional_$_NAME_cidr_blocks}"
  additional_manager_security_group_ids = [
    "${data.terraform_remote_state.artemis.security_group_id}"
  ]
  additional_manager_cidr_blocks = "${var.additional_manager_cidr_blocks}"


}
