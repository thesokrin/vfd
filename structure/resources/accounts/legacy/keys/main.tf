# Atlas Production 2.0 Account - Shared Key Resources

provider "aws" {
  region = "${var.aws_region}"
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "shared_keys" {
  source = "../../../../modules/atlas_shared_keys"
}
