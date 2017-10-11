# Atlas Data-Science Environment - Redshift Cluster Resources - Security Group

resource "aws_security_group" "default" {
  name        = "redshift.${var.zone}"
  description = "Security group for Redshift Cluster in the ${var.env_name_fancy}."
  vpc_id      = "${var.vpc_id}"

  # database port inbound
  ingress {
    protocol  = "tcp"
    from_port = "${var.redshift_database_port}"
    to_port   = "${var.redshift_database_port}"

    cidr_blocks = ["${concat(
      var.layer_admin_cidr_blocks,
      var.layer_data_cidr_blocks,
      var.layer_services_cidr_blocks
    )}"]
  }

  # database port inbound
  ingress {
    protocol    = "tcp"
    from_port   = "${var.redshift_database_port}"
    to_port     = "${var.redshift_database_port}"
    cidr_blocks = ["${var.lahq_cidr_block}", "${var.atlas_manager_ip}"]
  }

  # egress to anywhere
  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "redshift.${var.zone}"

    # atlas variables
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer       = "data"
    atlas_project     = "redshift"
    atlas_owner       = "datascience"
  }

  lifecycle {
    create_before_destroy = true
  }
}
