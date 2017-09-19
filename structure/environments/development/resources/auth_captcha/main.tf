# Atlas Development Environment - Auth Captcha Resources

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
    "captcha-dev.grindr.com"
  ]
}
