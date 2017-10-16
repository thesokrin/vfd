# Atlas $_ENVIRONMENT - $_FANCY_NAME

provider "aws" {
  allowed_account_ids = ["${var.aws_account_id}"]
  region = "${var.aws_region}"
}

module "$_MODULE" {
  source             = "../../../../modules/$_MODULE"

  # variables
  atlas_environment  = "${var.atlas_environment}"

  name               = "$_NAME"
  project_name       = "${var.project_name}"
}
