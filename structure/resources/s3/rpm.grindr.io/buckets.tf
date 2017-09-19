# Atlas S3 Resources - RPM Bucket Resources

resource "aws_s3_bucket" "default" {
  bucket        = "rpm.grindr.io"
  acl           = ""
  force_destroy = false
  region        = "${var.aws_region}"

  cors_rule {
    allowed_headers = ["Authorization"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    max_age_seconds = 3000
  }

  logging {
    target_bucket = "${var.logging_bucket}"
    target_prefix = "${var.logging_bucket_prefix}"
  }

  lifecycle_rule {
    id      = "Expire Versions"
    prefix  = ""
    enabled = true

    noncurrent_version_expiration {
      days = 90
    }
  }

  versioning {
    enabled = true
  }

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags {
    Name = "rpm.grindr.io"

    # atlas variables
    atlas_owner = "isre"
  }
}
