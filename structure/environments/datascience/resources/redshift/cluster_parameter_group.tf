# Atlas Data-Science Environment - Redshift Cluster Resources - Parameter Group

resource "aws_redshift_parameter_group" "default" {
  name   = "${var.redshift_cluster_id}"
  family = "redshift-1.0"

  parameter {
    name  = "require_ssl"
    value = "true"
  }

  parameter {
    name  = "enable_user_activity_logging"
    value = "true"
  }
}
