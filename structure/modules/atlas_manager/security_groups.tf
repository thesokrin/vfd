# Atlas Manager Module - Security Groups

resource "aws_security_group" "manager" {
  name        = "manager.${var.zone}"
  description = "Security group for Manager instances in the ${var.stack_name_fancy}."
  vpc_id      = "${var.vpc_id}"

  # ssh inbound
  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  # egress to anywhere
  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "manager.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.stack_name}"
    atlas_layer = "dmz"
    atlas_project = "manager"
    atlas_owner = "isre"
  }

  lifecycle {
    create_before_destroy = true
  }
}
