# Atlas Hub

module "stack" {
  source = "../atlas_stack"
  # inputs
  id = "${var.id}"
  name = "${var.name}"
  name_short = "${var.name_short}"
  name_fancy = "${var.name_fancy}"
  zone = "${var.name_short}.grindr.io"
}

data "aws_region" "current" {
  current = true
}
