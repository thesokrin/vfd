# Atlas Staging Environment - Elasticsearch Resources

provider "aws" {
  region = "${data.terraform_remote_state.atlas.aws_region}"

  # only allowed in staging
  allowed_account_ids = ["${data.terraform_remote_state.atlas.aws_account_id}"]
}

data "terraform_remote_state" "atlas" {
  backend = "s3"

  config {
    region = "us-east-1"
    bucket = "isre.grindr.io"
    key    = "terraform/environments/staging/atlas.tfstate"
  }
}

module "elasticsearch" {
  source = "../../../../modules/elasticsearch"

  # inputs
  name                     = "${var.name}"
  asg_capacity             = "${var.asg_capacity}"
  elasticsearch_cluster_id = "${var.elasticsearch_cluster_id}"
  project_name             = "${var.project_name}"

  env_name       = "${data.terraform_remote_state.atlas.env_name}"
  env_name_short = "${data.terraform_remote_state.atlas.env_name_short}"
  env_name_fancy = "${data.terraform_remote_state.atlas.env_name_fancy}"

  cidr_block                 = "${data.terraform_remote_state.atlas.cidr_block}"
  layer_data_subnet_ids      = ["${data.terraform_remote_state.atlas.layer_data_subnet_ids}"]
  layer_data_cidr_blocks     = ["${data.terraform_remote_state.atlas.layer_data_cidr_blocks}"]
  layer_services_cidr_blocks = ["${data.terraform_remote_state.atlas.layer_services_cidr_blocks}"]
  layer_admin_cidr_blocks    = ["${data.terraform_remote_state.atlas.layer_admin_cidr_blocks}"]
  private_zone_id            = "${data.terraform_remote_state.atlas.private_zone_id}"
  vpc_id                     = "${data.terraform_remote_state.atlas.vpc_id}"
  zone                       = "${data.terraform_remote_state.atlas.zone}"
}
