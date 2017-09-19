# Atlas S3 Resources - APT Bucket Resources - IAM Resources

data "template_file" "bucket_policy" {
  template = "${file("${path.module}/policies/bucket-policy.json.tpl")}"

  vars {
    aws_accounts = "${jsonencode(formatlist("arn:aws:iam::%s:root", values(var.aws_accounts)))}"
    aws_vpces    = "${jsonencode(values(var.vpc_endpoint_ids))}"
  }
}

resource "aws_s3_bucket_policy" "default" {
  bucket = "${aws_s3_bucket.default.bucket}"
  policy = "${data.template_file.bucket_policy.rendered}"
}
