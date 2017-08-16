# Atlas RDS Cluster Module - KMS Key

resource "aws_kms_key" "default" {
  description             = "Atlas KMS Key for RDS Cluster ${var.cluster_id}"
  deletion_window_in_days = 30
  enable_key_rotation     = true
}
