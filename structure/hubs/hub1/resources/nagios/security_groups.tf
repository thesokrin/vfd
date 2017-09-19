# Atlas Hub - Nagios Resources - Security Groups

resource "aws_security_group" "default" {
  name = "nagios.${var.zone}"
  description = "Security group for Nagios in the ${var.env_name_fancy}."
  vpc_id = "${var.vpc_id}"

  # ssh inbound
  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = [
      "${var.env_cidr_block}",
      "${var.lahq_cidr_block}"
    ]
  }

  # egress anywhere
  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "nagios.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "admin"
    atlas_project = "nagios"
    atlas_owner = "isre"
  }

  lifecycle {
    create_before_destroy = true
  }
}
