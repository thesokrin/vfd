# Atlas RDS Cluster Module - Parameter Groups

resource "aws_rds_cluster_parameter_group" "default" {
  name        = "${var.cluster_id}-cluster-pg"
  family      = "${var.parameter_group_family}"
  description = "${var.cluster_id} cluster parameter group"

  parameter {
    name         = "character_set_connection"
    value        = "${var.pgc_character_set_connection}"
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_database"
    value        = "${var.pgc_character_set_database}"
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_server"
    value        = "${var.pgc_character_set_server}"
    apply_method = "immediate"
  }

  tags {
    Name = "${var.cluster_id}-cluster-pg.${var.zone}"

    # atlas variables
    atlas_environment = "${var.env_name}"
    atlas_layer       = "data"
    atlas_owner       = "${var.atlas_owner}"
    atlas_project     = "${var.atlas_project}"
    atlas_zone        = "${var.zone}"
  }
}

resource "aws_db_parameter_group" "default" {
  name        = "${var.cluster_id}-instance-pg"
  family      = "${var.parameter_group_family}"
  description = "${var.cluster_id} db instances parameter group"

  parameter {
    name         = "max_connections"
    value        = "${var.pgi_max_connections}"
    apply_method = "immediate"
  }

  tags {
    Name = "${var.cluster_id}-instance-pg.${var.zone}"

    # atlas variables
    atlas_environment = "${var.env_name}"
    atlas_layer       = "data"
    atlas_owner       = "${var.atlas_owner}"
    atlas_project     = "${var.atlas_project}"
    atlas_zone        = "${var.zone}"
  }
}
