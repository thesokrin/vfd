# Atlas Autospotting Module - Cloudwatch Resources

resource "aws_cloudwatch_event_rule" "cloudwatch_frequency" {
  name = "atlas_autospotting_frequency"
  schedule_expression = "${var.lambda_run_frequency}"
}

resource "aws_cloudwatch_event_target" "cloudwatch_target" {
  rule = "${aws_cloudwatch_event_rule.cloudwatch_frequency.name}"
  target_id = "run_autospotting"
  arn = "${aws_lambda_function.autospotting.arn}"
}

resource "aws_cloudwatch_log_group" "log_group_autospotting" {
  name = "/aws/lambda/${aws_lambda_function.autospotting.function_name}"
  retention_in_days = 7
}
