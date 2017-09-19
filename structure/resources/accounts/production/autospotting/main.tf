# Atlas Production 3.0 Account - Autospotting Resource

provider "aws" {
  region = "us-east-1"
  # only allowed in preprod
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "autospotting" {
  source = "../../../../modules/autospotting"

  name = "${var.name}"
  autospotting_min_on_demand_percentage = "${var.autospotting_min_on_demand_percentage}"
}
