# Atlas Zookeeper Module - Security Groups

resource "aws_security_group" "default" {
  name        = "${var.name}.${var.zone}"
  description = "Security group for Zookeeper (${var.name}) instances  in the ${var.env_name_fancy}."
  vpc_id      = "${var.vpc_id}"

  # ssh inbound
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["${var.cidr_block}"]
  }

  # ingress in from data, services, and admin to 2181 port
  ingress {
    protocol  = "tcp"
    from_port = 2181
    to_port   = 2181

    cidr_blocks = ["${concat(
      var.layer_admin_cidr_blocks,
      var.layer_data_cidr_blocks,
      var.layer_services_cidr_blocks,
      var.additional_zookeeper_cidr_blocks
    )}"]
  }

  # ingress in for 2888, and 3888 between zookeeper nodes
  ingress {
    protocol  = "tcp"
    from_port = 2888
    to_port   = 2888
    self      = true
  }

  ingress {
    protocol  = "tcp"
    from_port = 3888
    to_port   = 3888
    self      = true
  }

  # ingress to exhibitor http port for members of same sg and for artemis
  ingress {
    protocol        = "tcp"
    from_port       = 8080
    to_port         = 8080
    self            = true
    security_groups = ["${var.artemis_sg_id}"]
    cidr_blocks     = ["${var.additional_exhibitor_cidr_blocks}"]
  }

  # egress anywhere
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
    atlas_layer       = "admin"
    atlas_project     = "${var.project_name}"
    atlas_owner       = "${var.project_owner}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
