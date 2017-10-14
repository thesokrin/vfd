# Atlas hub Environment - Jenkins Master

module "atlas_static_service" {
  source = "../../../../modules/atlas_static_service"

  # inputs
  name                       = "${var.name}"
  aws_region                 = "${var.aws_region}"
  env_name                   = "${var.env_name}"
  project_name               = "${var.project_name}"
  role_package               = "${var.jenkinsmaster_role_package}"
  ec2_instance_count         = "${var.jenkinsmaster_instance_count}"
  ec2_instance_type          = "${var.jenkinsmaster_instance_type}"

  additional_jenkinsmaster_cidr_blocks   = "${var.additional_jenkinsmaster_cidr_blocks}"
  additional_manager_security_group_ids = [
    "${data.terraform_remote_state.artemis.security_group_id}"
  ]
  additional_manager_cidr_blocks = "${var.additional_manager_cidr_blocks}"


}
