# Code Pipeline Module - Lambda Resources

resource "aws_lambda_function" "unzip" {
  function_name = "atlas_code_pipeline_unzip_${var.name}"
  filename = "${path.module}/code_pipeline.zip"
  source_code_hash = "${base64sha256(file("${path.module}/code_pipeline.zip"))}"
  role = "${aws_iam_role.code_pipeline_lambda_role.arn}"
  runtime = "python2.7"
  timeout = "${var.lambda_timeout}"
  handler = "lambda.handler"
  # need to store some files into memory so need more memory
  memory_size = "512"

  environment {
    variables = {
      target_bucket = "${aws_s3_bucket.default.bucket}"
      target_root_folder = "${aws_s3_bucket_object.lambda_location.key}"
      expected_file = "${var.expected_deploy_file}"

      # these are jammed here because our terraform doesn't support lambda tags
      Name = "code_pipeline_unzip_${var.name}"
      atlas_owner = "isre"
    }
  }
}
