# Atlas RDS Cluster Module - Security Groups

resource "aws_security_group" "default" {
  name        = "${var.cluster_id}.${var.zone}"
  description = "Security group for ${var.atlas_project} RDS Cluster in ${var.env_name_fancy}."
  vpc_id      = "${var.vpc_id}"

  # database port inbound
  ingress {
    protocol  = "tcp"
    from_port = "${var.database_port}"
    to_port   = "${var.database_port}"

    cidr_blocks = ["${concat(
      var.layer_admin_cidr_blocks,
      var.layer_data_cidr_blocks,
      var.layer_services_cidr_blocks,
      var.additional_aurora_cidr_blocks
    )}"]
  }

  # egress to anywhere
  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.cluster_id}.${var.zone}"

    # atlas variables
    atlas_environment = "${var.env_name}"
    atlas_layer       = "data"
    atlas_owner       = "${var.atlas_owner}"
    atlas_project     = "${var.atlas_project}"
    atlas_zone        = "${var.zone}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
