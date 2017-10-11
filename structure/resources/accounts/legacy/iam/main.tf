# Atlas Production 2.0 Account - IAM Resources

provider "aws" {
  # only allowed in us-east-1
  region = "${var.aws_region}"

  # only allowed in one fixed AWS account
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "global" {
  source = "../../../../modules/atlas_iam_global"
  # variables
  aws_account_id = "${var.aws_account_id}"
}
