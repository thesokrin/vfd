# Production 2.0 Account - S3 Resources - s3.grindr.com

resource "aws_s3_bucket" "s3_grindr_com" {
  bucket = "s3.grindr.com"
  acl    = ""
  force_destroy = false

  logging {
    target_bucket = "cv-log-f3d41fc65386b646caa0f801cf2d8c16"
    target_prefix = "s3.grindr.com"
  }
}
