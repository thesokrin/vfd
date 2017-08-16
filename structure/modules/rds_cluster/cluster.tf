# Atlas RDS Cluster Module - Cluster Definition

resource "aws_rds_cluster" "default" {
  cluster_identifier = "${var.cluster_id}"

  apply_immediately               = "${var.apply_immediately}"
  backup_retention_period         = "${var.backup_retention_period}"
  database_name                   = "${var.database_name}"
  db_cluster_parameter_group_name = "${aws_rds_cluster_parameter_group.default.id}"
  db_subnet_group_name            = "${aws_db_subnet_group.default.id}"
  final_snapshot_identifier       = "${var.cluster_id}-final-snapshot"
  master_password                 = "${var.password}"
  master_username                 = "${var.username}"
  port                            = "${var.database_port}"
  preferred_backup_window         = "${var.preferred_backup_window}"
  preferred_maintenance_window    = "${var.maintenance_window}"
  skip_final_snapshot             = "${var.skip_final_snapshot}"
  storage_encrypted               = true
  vpc_security_group_ids          = ["${aws_security_group.default.id}"]
  kms_key_id                      = "${aws_kms_key.default.arn}"
}

resource "aws_rds_cluster_instance" "masters" {
  count      = "${var.masters_instance_count}"
  identifier = "${var.cluster_id}-master-${count.index + 1}"

  apply_immediately       = "${var.apply_immediately}"
  cluster_identifier      = "${aws_rds_cluster.default.id}"
  db_parameter_group_name = "${aws_db_parameter_group.default.id}"
  db_subnet_group_name    = "${aws_db_subnet_group.default.id}"
  instance_class          = "${var.instance_class_master}"
  publicly_accessible     = "${var.publicly_accessible}"
  promotion_tier          = "${count.index == 0 ? 0 : 1 }"

  tags {
    Name = "${var.cluster_id}-master-${count.index + 1}"

    # atlas variables
    atlas_environment = "${var.env_name}"
    atlas_layer       = "data"
    atlas_owner       = "${var.atlas_owner}"
    atlas_project     = "${var.atlas_project}"
    atlas_zone        = "${var.zone}"
  }
}

resource "aws_rds_cluster_instance" "slaves" {
  count      = "${var.slaves_instance_count}"
  identifier = "${var.cluster_id}-slave-${count.index + 1}"

  apply_immediately       = "${var.apply_immediately}"
  cluster_identifier      = "${aws_rds_cluster.default.id}"
  db_parameter_group_name = "${aws_db_parameter_group.default.id}"
  db_subnet_group_name    = "${aws_db_subnet_group.default.id}"
  instance_class          = "${var.instance_class_slave}"
  promotion_tier          = 5
  publicly_accessible     = "${var.publicly_accessible}"

  depends_on = ["aws_rds_cluster_instance.masters"]

  tags {
    Name = "${var.cluster_id}-slave-${count.index + 1}"

    # atlas variables
    atlas_environment = "${var.env_name}"
    atlas_layer       = "data"
    atlas_owner       = "${var.atlas_owner}"
    atlas_project     = "${var.atlas_project}"
    atlas_zone        = "${var.zone}"
  }
}

resource "aws_rds_cluster_instance" "reporting" {
  count      = "${var.reporting_instance == 1 ? 1 : 0 }"
  identifier = "${var.cluster_id}-reporting"

  apply_immediately       = "${var.apply_immediately}"
  cluster_identifier      = "${aws_rds_cluster.default.id}"
  db_parameter_group_name = "${aws_db_parameter_group.default.id}"
  db_subnet_group_name    = "${aws_db_subnet_group.default.id}"
  instance_class          = "${var.instance_class_reporting}"
  promotion_tier          = 15
  publicly_accessible     = "${var.publicly_accessible}"

  depends_on = ["aws_rds_cluster_instance.masters"]

  tags {
    Name = "${var.cluster_id}-reporting"

    # atlas variables
    atlas_environment = "${var.env_name}"
    atlas_layer       = "data"
    atlas_owner       = "${var.atlas_owner}"
    atlas_project     = "${var.atlas_project}"
    atlas_zone        = "${var.zone}"
  }
}
