# Atlas Autospotting Module - Lambda Resources

resource "aws_lambda_function" "autospotting" {
  function_name = "atlas_${var.name}"
  filename = "${path.module}/autospotting_build_669dc3c.zip"
  source_code_hash = "${base64sha256(file("${path.module}/autospotting_build_669dc3c.zip"))}"
  role = "${aws_iam_role.default.arn}"
  runtime = "python2.7"
  timeout = "${var.lambda_timeout}"
  handler = "handler.Handle"
  memory_size = "256"

  environment {
    variables = {
      MIN_ON_DEMAND_NUMBER = "${var.autospotting_min_on_demand_number}"
      MIN_ON_DEMAND_PERCENTAGE = "${var.autospotting_min_on_demand_percentage}"
      REGIONS = "${var.autospotting_regions_enabled}"

      # these are jammed here because our terraform doesn't support lambda tags
      Name = "${var.name}"
      atlas_owner = "isre"
    }
  }
}

resource "aws_lambda_permission" "cloudwatch_events_permission" {
  statement_id = "AllowExecutionFromCloudWatch"
  action = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.autospotting.function_name}"
  principal = "events.amazonaws.com"
  source_arn = "${aws_cloudwatch_event_rule.cloudwatch_frequency.arn}"
}
