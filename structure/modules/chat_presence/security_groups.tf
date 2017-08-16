# Chat Presence Module - Security Groups

resource "aws_security_group" "default" {
  name = "presence.${var.zone}"
  description = "Security group for ${var.project_name_fancy} instances in the ${var.env_name_fancy}."
  vpc_id = "${var.vpc_id}"

  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = [
      "${var.env_cidr_block}",
      "${var.hub_cidr_block}",
      "${var.lahq_cidr_block}"
    ]
  }

  # websocket port
  ingress {
    protocol = "tcp"
    from_port = 4000
    to_port = 4000
    cidr_blocks = ["${concat(
      var.layer_dmz_cidr_blocks,
      var.layer_public_cidr_blocks,
      var.layer_services_cidr_blocks
    )}"]
  }

  # healthcheck port
  ingress {
    protocol = "tcp"
    from_port = 9000
    to_port = 9000
    cidr_blocks = ["${concat(
      var.layer_dmz_cidr_blocks,
      var.layer_public_cidr_blocks,
      var.layer_services_cidr_blocks
    )}"]
  }

  # epmd and gossip ports allowed only within same security group
  ingress {
    protocol = "tcp"
    from_port = 4369
    to_port = 4370
    self = true
  }

  # icmp for tcp management
  ingress {
    protocol = "icmp"
    from_port = 0
    to_port = 4
    cidr_blocks = ["${var.env_cidr_block}"]
  }

  egress {
    protocol = "-1"
    from_port = "0"
    to_port = "0"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "presence.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "services"
    atlas_project = "${var.project_name}"
    atlas_owner = "${var.project_owner}"
  }
}

resource "aws_security_group" "direct_elb" {
  name = "presence-direct-elb.${var.zone}"
  description = "Security group for the ${var.project_name_fancy} direct load balancer in the ${var.env_name_fancy}."
  vpc_id = "${var.vpc_id}"

  ingress {
    protocol = "tcp"
    from_port = 443
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol = "-1"
    from_port = "0"
    to_port = "0"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "presence-direct-elb.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "dmz"
    atlas_project = "${var.project_name}"
    atlas_owner = "${var.project_owner}"
  }
}
