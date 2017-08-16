# Atlas CDN Module - DNS Resources

resource "aws_route53_record" "default_ipv4" {
  name = "${var.name}"
  type = "A"
  zone_id = "${var.public_zone_id}"

  alias {
    name = "${aws_cloudfront_distribution.default.domain_name}"
    zone_id = "${aws_cloudfront_distribution.default.hosted_zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "default_ipv6" {
  name = "${var.name}"
  type = "AAAA"
  zone_id = "${var.public_zone_id}"

  alias {
    name = "${aws_cloudfront_distribution.default.domain_name}"
    zone_id = "${aws_cloudfront_distribution.default.hosted_zone_id}"
    evaluate_target_health = true
  }
}
