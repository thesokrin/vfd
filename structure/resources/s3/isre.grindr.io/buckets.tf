# Atlas S3 Resources - ISRE Bucket Resources

resource "aws_s3_bucket" "default" {
  bucket = "isre.grindr.io"

  logging {
    target_bucket = "${var.logging_bucket}"
    target_prefix = "${var.logging_bucket_prefix}"
  }

  versioning {
    enabled = true
  }

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags {
    Name = "isre.grindr.io"
    # atlas variables
    atlas_owner = "isre"
  }
}
