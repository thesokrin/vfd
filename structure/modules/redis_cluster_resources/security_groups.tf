# Atlas Redis Cluster Resources Module - Security Groups

resource "aws_security_group" "default" {
  name        = "${var.name}.${var.zone}"
  description = "Security group for Redis Cluster (${var.name}) instances in the ${var.env_name_fancy}."
  vpc_id      = "${var.vpc_id}"

  # ssh inbound
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["${var.cidr_block}"]
  }

  # ingress in from self, data layer, services layer, and admin layer to service port
  ingress {
    protocol  = "tcp"
    from_port = 6379
    to_port   = 6379

    self      = true

    cidr_blocks = ["${concat(
      var.layer_admin_cidr_blocks,
      var.layer_data_cidr_blocks,
      var.layer_services_cidr_blocks,
      var.additional_cidr_blocks,
    )}"]
  }

  # ingress in for cluster port from within security group
  ingress {
    protocol  = "tcp"
    from_port = 16379
    to_port   = 16379
    self      = true
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
    atlas_layer       = "data"
    atlas_project     = "${var.project_name}"
    atlas_owner       = "${var.project_owner}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
