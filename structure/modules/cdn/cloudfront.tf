# CDN Module - CloudFront Resources

resource "aws_cloudfront_distribution" "default" {
  enabled = true
  comment = "${var.name}.${var.zone} distribution."

  is_ipv6_enabled = true
  http_version = "http2"
  default_root_object = "index.html"

  aliases = "${var.website_aliases}"

  price_class = "PriceClass_All"

  origin {
    origin_id = "s3"
    domain_name = "${aws_s3_bucket.default.website_endpoint}"

    custom_origin_config {
      http_port = 80
      https_port = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols = ["TLSv1"]
    }
  }

  custom_error_response {
    # take all 404s, cache them for five seconds, and serve back index.html with a 2000
    error_code = 404
    error_caching_min_ttl = 5
    response_code = 200
    response_page_path = "/index.html"
  }

  default_cache_behavior {
    target_origin_id = "s3"

    compress = false

    min_ttl     = 0
    default_ttl = 0
    max_ttl     = 0

    allowed_methods = ["HEAD", "GET", "OPTIONS"]
    cached_methods  = ["HEAD", "GET"]

    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  viewer_certificate {
    acm_certificate_arn = "${var.wildcard_certificate_arn}"
    minimum_protocol_version = "TLSv1"
    ssl_support_method = "sni-only"
  }

  restrictions {
    geo_restriction { restriction_type = "none" }
  }
}
