# Atlas Production Environment - Elasticsearch Cascade Resources - Kibana

module "kibana" {
  source = "../../../../modules/kibana"

  # inputs
  aws_region    = "${var.aws_region}"
  name          = "${var.name}"
  env_name      = "${var.env_name}"
  project_name  = "${var.project_name}"
  project_owner = "${var.project_owner}"
  role_package  = "grindr-role-elasticsearch-kibana"
  additional_cidr_blocks = "${var.additional_cidr_blocks}"
  ec2_instance_type = "m4.large"
}
