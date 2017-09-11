# Atlas Data-Science Environment - DC/OS Services Workers

provider "aws" {
  # only allowed in us-east-1
  region = "${var.aws_region}"

  # only allowed in one fixed AWS account
  allowed_account_ids = ["${var.aws_account_id}"]
}

data "aws_region" "current" {
  current = true
}

module "dcos_services_workers" {
  source = "../../../../modules/atlas_dcos_services_workers"

  # inputs
  asg_capacity               = "${var.asg_capacity}"
  ec2_instance_type          = "${var.ec2_instance_type}"
  cidr_block                 = "${var.cidr_block}"
  layer_public_cidr_blocks   = ["${var.layer_public_cidr_blocks}"]
  layer_services_cidr_blocks = ["${var.layer_services_cidr_blocks}"]
  layer_services_subnet_ids  = ["${var.layer_services_subnet_ids}"]
  project_name_fancy         = "${var.project_name_fancy}"
  private_zone_id            = "${var.private_zone_id}"
  s3_repo_bucket_name        = "${var.s3_repo_bucket_name}"
  stack_name                 = "${var.env_name}"
  stack_name_fancy           = "${var.env_name_fancy}"
  stack_name_short           = "${var.env_name_short}"
  stack_region               = "${data.aws_region.current.name}"
  vpc_id                     = "${var.vpc_id}"
  zone                       = "${var.zone}"
}
