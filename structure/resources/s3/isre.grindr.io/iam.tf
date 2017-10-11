# Atlas S3 Resources - ISRE Bucket Resources - IAM Resources

data "template_file" "bucket_policy" {
  template = "${file("${path.module}/policies/bucket-policy.json.tpl")}"

  vars {
    aws_account_dev = "${var.aws_accounts["dev"]}"
    aws_account_staging = "${var.aws_accounts["staging"]}"
    aws_account_preprod = "${var.aws_accounts["preprod"]}"
    aws_account_2_0 = "${var.aws_accounts["2.0"]}"
    aws_account_3_0 = "${var.aws_accounts["3.0"]}"
  }
}

resource "aws_s3_bucket_policy" "default" {
  bucket = "${aws_s3_bucket.default.bucket}"
  policy = "${data.template_file.bucket_policy.rendered}"
}
