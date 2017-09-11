# Atlas Data-Science Environment - Redshift Cluster Resources - Subnet Group

resource "aws_redshift_subnet_group" "default" {
  name       = "${var.redshift_cluster_id}"
  subnet_ids = ["${var.layer_data_subnet_ids}"]

  tags {
    Name = "redshift.${var.zone}"
    # atlas variables
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer       = "data"
    atlas_owner       = "datascience"
    atlas_project     = "redshift"
  }

  lifecycle {
    create_before_destroy = true
  }
}
