# Atlas Production Environment - Auth Captcha Resources

provider "aws" {
  region = "${var.aws_region}"
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "cdn" {
  source = "../../../../modules/cdn"

  # variables
  name = "captcha"
  project_name = "captcha"
  project_owner = "authenticity"

  env_name = "${var.env_name}"
  env_name_short = "${var.env_name_short}"
  public_zone_id = "${var.public_zone_id}"
  wildcard_certificate_arn = "${var.wildcard_certificate_arn}"
  zone = "${var.zone}"
  website_aliases = [
    "captcha.${var.zone}",
    "captcha-prod.grindr.com"
  ]
}

# memberships
resource "aws_iam_group_membership" "auth_captcha_curators" {
  name = "${module.cdn.iam_group}_membership"
  group = "${module.cdn.iam_group}"
  users = [
    "guillermo.alvarez"
  ]
}
