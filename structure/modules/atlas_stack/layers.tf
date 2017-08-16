# Atlas Stack - Layers

module "dmz" {
  source = "../atlas_layer"
  # variables
  name = "dmz"
  is_dmz = true

  cidr_mask_bits = 8
  cidr_start = 1

  stack_vpc_id = "${aws_vpc.vpc.id}"
  stack_cidr_block = "${aws_vpc.vpc.cidr_block}"
  stack_zone = "${var.zone}"
}

module "admin" {
  source = "../atlas_layer"
  # variables
  name = "admin"

  cidr_mask_bits = 7
  cidr_start = 5

  stack_vpc_id = "${aws_vpc.vpc.id}"
  stack_cidr_block = "${aws_vpc.vpc.cidr_block}"
  stack_zone = "${var.zone}"
}

module "public" {
  source = "../atlas_layer"
  # variables
  name = "public"

  cidr_mask_bits = 7
  cidr_start = 10

  stack_vpc_id = "${aws_vpc.vpc.id}"
  stack_cidr_block = "${aws_vpc.vpc.cidr_block}"
  stack_zone = "${var.zone}"
}

module "services" {
  source = "../atlas_layer"
  # variables
  name = "services"

  cidr_mask_bits = 7
  cidr_start = 15

  stack_vpc_id = "${aws_vpc.vpc.id}"
  stack_cidr_block = "${aws_vpc.vpc.cidr_block}"
  stack_zone = "${var.zone}"
}

module "data" {
  source = "../atlas_layer"
  # variables
  name = "data"

  cidr_mask_bits = 7
  cidr_start = 20

  stack_vpc_id = "${aws_vpc.vpc.id}"
  stack_cidr_block = "${aws_vpc.vpc.cidr_block}"
  stack_zone = "${var.zone}"
}

module "net" {
  source = "../atlas_layer"
  # variables
  name = "net"

  cidr_mask_bits = 8
  cidr_start = 250

  stack_vpc_id = "${aws_vpc.vpc.id}"
  stack_cidr_block = "${aws_vpc.vpc.cidr_block}"
  stack_zone = "${var.zone}"
}
