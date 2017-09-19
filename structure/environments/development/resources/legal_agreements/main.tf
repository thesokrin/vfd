# Atlas Development Environment - Legal Agreements Resources

provider "aws" {
  region = "${var.aws_region}"
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "cdn" {
  source = "../../../../modules/cdn"

  # variables
  name = "legal-agreements"
  project_name = "legal-agreements"
  project_owner = "platform"

  env_name = "${var.env_name}"
  env_name_short = "${var.env_name_short}"
  public_zone_id = "${var.public_zone_id}"
  wildcard_certificate_arn = "${var.wildcard_certificate_arn}"
  zone = "${var.zone}"
  website_aliases = [
    "legal-agreements.${var.zone}",
    "legal-agreements-dev.grindr.com"
  ]
}
