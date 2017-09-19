# Atlas Production Environment - CDN Resources

provider "aws" {
  region = "${var.aws_region}"
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "cdn" {
  source = "../../../../modules/atlas_cdn"
  # variables
  env_name = "${var.env_name}"
  env_name_fancy = "${var.env_name_fancy}"
  env_name_short = "${var.env_name_short}"

  public_zone_id = "${var.public_zone_id}"

  wildcard_certificate_arn = "${var.wildcard_certificate_arn}"

  zone = "${var.zone}"
}
