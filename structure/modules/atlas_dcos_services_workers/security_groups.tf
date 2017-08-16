# Atlas DC/OS Services Workers Module - Security Groups

resource "aws_security_group" "default" {
  name        = "dcos-services.${var.zone}"
  vpc_id      = "${var.vpc_id}"
  description = "Security group for DC/OS Services Worker instances in the ${var.stack_name_fancy}."

  # http from public and services layers
  ingress {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80

    cidr_blocks = ["${concat(
      var.layer_public_cidr_blocks,
      var.layer_services_cidr_blocks
    )}"]
  }

  # https from public and services layers
  ingress {
    protocol  = "tcp"
    from_port = 443
    to_port   = 443

    cidr_blocks = ["${concat(
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
    Name = "dcos-services.${var.zone}"

    # atlas variables
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.stack_name}"
    atlas_layer       = "services"
    atlas_project     = "dcos_services_workers"
    atlas_role        = "services"
    atlas_owner       = "isre"
  }

  lifecycle {
    create_before_destroy = true
  }
}
