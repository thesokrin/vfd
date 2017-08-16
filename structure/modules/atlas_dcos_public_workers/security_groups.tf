# Atlas DC/OS Public Workers Module - Security Groups

resource "aws_security_group" "default" {
  name        = "dcos-public.${var.zone}"
  vpc_id      = "${var.vpc_id}"
  description = "Security group for ${var.project_name_fancy} instances in the ${var.stack_name_fancy}."

  # http from dmz, public, and services
  ingress {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80

    cidr_blocks = ["${concat(
      var.layer_dmz_cidr_blocks,
      var.layer_public_cidr_blocks,
      var.layer_services_cidr_blocks
    )}"]
  }

  # https from dmz, public, and services
  ingress {
    protocol  = "tcp"
    from_port = 443
    to_port   = 443

    cidr_blocks = ["${concat(
      var.layer_dmz_cidr_blocks,
      var.layer_public_cidr_blocks,
      var.layer_services_cidr_blocks
    )}"]
  }

  # marathon dynamic port range from public and services
  ingress {
    protocol  = "tcp"
    from_port = "${var.dynamic_port_start}"
    to_port   = "${var.dynamic_port_end}"

    cidr_blocks = ["${concat(
      var.layer_public_cidr_blocks,
      var.layer_services_cidr_blocks
    )}"]
  }

  # ssh from anywhere internal
  ingress {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22

    cidr_blocks = [
      "${var.cidr_block}",
      "${var.hub_cidr_block}",
      "${var.lahq_cidr_block}",
    ]
  }

  # TODO FIXME we do not understand which ports DC/OS actually needs open
  #            if we ever reach the point that we do, we should lock this down
  ingress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["${var.cidr_block}"]
  }

  # allow all egress
  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "dcos-public.${var.zone}"

    # atlas variables
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.stack_name}"
    atlas_layer       = "public"
    atlas_project     = "dcos_public_workers"
    atlas_role        = "public"
    atlas_owner       = "isre"
  }

  lifecycle {
    create_before_destroy = true
  }
}
