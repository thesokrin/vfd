# Atlas PreProd - MonkeyIsland resource

data "aws_caller_identity" "current" {}

provider "aws" {
  region = "${var.aws_region}"
  # only allowed in 2.0
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "monkeyisland" {
  source = "../../../../modules/monkey_island"

  #inputs
  aws_region = "${var.aws_region}"
  name = "${var.name}"
  project_name = "${var.name}"
  ec2_instance_count = "${var.ec2_instance_count}"

  zone = "${var.zone}"
  aws_account_id = "${var.aws_account_id}"

  env_name = "${var.env_name}"
  env_name_short = "${var.env_name_short}"
  env_name_fancy = "${var.env_name_fancy}"

}
