# Atlas Artemis Module - Security Groups

resource "aws_security_group" "default" {
  name = "${var.name}.${var.zone}"
  description = "Security group for ${var.project_name_fancy} instances in the ${var.env_name_fancy}."
  vpc_id = "${var.vpc_id}"

  # ssh
  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = ["${distinct(list(
        var.cidr_block,
        var.hub_cidr_block,
        var.lahq_cidr_block
      ))}"
    ]
  }

  # see: https://github.com/grindrllc/artemis/wiki/Specification
  ingress {
    protocol = "tcp"
    from_port = 80
    to_port = 86
    cidr_blocks = ["${concat(
      var.layer_dmz_cidr_blocks,
      var.layer_public_cidr_blocks
    )}"]
  }

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "artemis.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "public"
    atlas_project = "${var.project_name}"
    atlas_owner = "${var.project_owner}"
  }

  lifecycle {
    create_before_destroy = false
  }
}

resource "aws_security_group" "default_elb" {
  name = "${var.name}-elb.${var.zone}"
  description = "Security group for ${var.project_name_fancy} load balancers in the ${var.env_name_fancy}."
  vpc_id = "${var.vpc_id}"

  # http
  ingress {
    protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr_blocks = ["${concat(
      var.layer_public_cidr_blocks,
      var.layer_services_cidr_blocks
    )}"]
  }

  # https
  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["${concat(
      var.layer_public_cidr_blocks,
      var.layer_services_cidr_blocks
    )}"]
  }

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.name}-elb.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "public"
    atlas_project = "${var.project_name}"
    atlas_owner = "${var.project_owner}"
  }

  lifecycle {
    create_before_destroy = false
  }
}
