# Atlas Environment - S3 Resources

resource "aws_s3_bucket" "repository" {
  bucket = "repo.${module.stack.zone}"
  region = "${module.stack.aws_region}"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    id = "expire-versions"
    prefix = ""
    enabled = true

    noncurrent_version_expiration {
      days = 90
    }
  }

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  cors_rule {
    allowed_headers = ["Authorization"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    max_age_seconds = 3000
  }

  tags {
    Name = "repo.${module.stack.zone}"
    # atlas variables
    atlas_zone = "${module.stack.zone}"
    atlas_environment = "${var.name}"
    atlas_project = "environment"
    atlas_role = "repository"
    atlas_owner = "isre"
  }
}
