# Atlas RDS Cluster Module - Subnet Group

resource "aws_db_subnet_group" "default" {
  name        = "${var.cluster_id}-subnet-group"
  subnet_ids  = ["${var.layer_data_subnet_ids}"]
  description = "${var.cluster_id} subnet group"

  tags {
    Name = "${var.cluster_id}-subnet-group.${var.zone}"

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
