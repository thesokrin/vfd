# Atlas Preprod Account - IAM Resources

provider "aws" {
  region = "${var.aws_region}"
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "global" {
  source = "../../../../modules/atlas_iam_global"
  # variables
  aws_account_id = "${var.aws_account_id}"
}
