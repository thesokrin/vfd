resource "aws_cloudwatch_log_group" "log_group_unzip" {
  name = "/aws/lambda/${aws_lambda_function.unzip.function_name}"
  retention_in_days = 7
}
