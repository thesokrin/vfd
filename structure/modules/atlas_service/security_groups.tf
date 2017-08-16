# Atlas Service Module - Security Groups

resource "aws_security_group" "instances" {
  name        = "${var.name}.${var.zone}"
  description = "Security group for ${var.project_name_fancy} instances in the ${var.env_name_fancy}."
  vpc_id      = "${var.vpc_id}"

  # ssh
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

  ingress {
    protocol  = "${var.sg_instance_protocol}"
    from_port = "${var.sg_instance_from_port}"
    to_port   = "${var.sg_instance_to_port}"

    cidr_blocks = ["${concat(
      var.layer_public_cidr_blocks,
      var.layer_services_cidr_blocks,
      var.layer_admin_cidr_blocks
    )}"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.name}.${var.zone}"

    # atlas variables
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer       = "services"
    atlas_project     = "${var.project_name}"
    atlas_owner       = "${var.project_owner}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "internal_elb" {
  name        = "${var.name}-elb.${var.zone}"
  description = "Security group for ${var.project_name_fancy} load balancers in the ${var.env_name_fancy}."
  vpc_id      = "${var.vpc_id}"

  # http
  ingress {
    protocol  = "${var.sg_elb_protocol}"
    from_port = "${var.sg_elb_from_port}"
    to_port   = "${var.sg_elb_to_port}"

    cidr_blocks = ["${concat(
      var.layer_public_cidr_blocks,
      var.layer_services_cidr_blocks,
      var.layer_admin_cidr_blocks
    )}"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.name}-elb.${var.zone}"

    # atlas variables
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer       = "public"
    atlas_project     = "${var.project_name}"
    atlas_owner       = "${var.project_owner}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
