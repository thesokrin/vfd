{
  "Id": "6401D401-E20A-4F2A-AB8E-AED05465D2B1",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": "AllowLambdaCodePipeline${name}"
    }
  ]
}
