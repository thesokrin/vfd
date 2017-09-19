# Atlas Production Environment - Data Retention Resources - Instances
module "service" {
  source             = "../../../../modules/atlas_static_service"

  # variables
  atlas_environment  = "${var.env_name}"

  name               = "data-retention"
  project_name       = "${var.project_name}"
  project_owner      = "${var.project_owner}"

  ec2_iam_role       = "${aws_iam_role.default.name}"
  ec2_instance_count = 1
  ec2_instance_type  = "${var.ec2_instance_type}"
}
