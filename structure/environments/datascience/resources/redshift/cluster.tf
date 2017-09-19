# Atlas Data-Science Environment - Redshift Cluster Resources - Cluster Config

resource "aws_redshift_cluster" "default" {
  automated_snapshot_retention_period = "${var.redshift_snapshot_retention_period}"
  availability_zone                   = "${var.availability_zones[0]}"
  cluster_identifier                  = "${var.redshift_cluster_id}"
  cluster_parameter_group_name        = "${aws_redshift_parameter_group.default.id}"
  cluster_subnet_group_name           = "${aws_redshift_subnet_group.default.id}"
  cluster_type                        = "${var.redshift_cluster_type}"
  database_name                       = "${var.redshift_database}"
  enable_logging                      = false
  encrypted                           = true
  iam_roles                           = ["${aws_iam_role.default.arn}"]
  master_password                     = "${var.redshift_password}"
  master_username                     = "${var.redshift_username}"
  node_type                           = "${var.redshift_node_type}"
  number_of_nodes                     = "${var.redshift_node_count}"
  preferred_maintenance_window        = "${var.redshift_maintenance_window}"
  skip_final_snapshot                 = false
  vpc_security_group_ids              = ["${aws_security_group.default.id}"]

  tags {
    Name = "redshift.${var.zone}"

    # atlas variables
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer       = "data"
    atlas_owner       = "datascience"
    atlas_project     = "redshift"
  }
}
