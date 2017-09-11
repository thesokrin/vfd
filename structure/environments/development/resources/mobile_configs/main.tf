# Atlas Development Environment - Chat Configs Resources

provider "aws" {
  region = "${var.aws_region}"
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "cdn" {
  source = "../../../../modules/cdn"

  # variables
  name = "mobile-configs"
  project_name = "mobile-configs"
  project_owner = "chat"

  env_name = "${var.env_name}"
  env_name_short = "${var.env_name_short}"
  public_zone_id = "${var.public_zone_id}"
  wildcard_certificate_arn = "${var.wildcard_certificate_arn}"
  zone = "${var.zone}"
  website_aliases = [
    "${var.name}.${var.zone}",
    "${var.name}-${var.env_name_short}.grindr.com"
  ]
}

resource "aws_iam_group_membership" "mobile_config_membership" {
  name = "${module.cdn.iam_group}_membership"
  group = "${module.cdn.iam_group}"
  users = [
  	"ben.brodie",
    "robert.tibljas",
    "andrew.chan",
    "simon.zelazny",
    "rafal.studnicki"
	]
}
