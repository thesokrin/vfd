{
  "Id": "c26d936d-fd33-476f-b934-73a10bbe41c8",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowCrossAccountAccess",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${aws_account_id}:root"
      },
      "Action": "s3:*",
      "Resource": [
        "arn:aws:s3:::${bucket}/*",
        "arn:aws:s3:::${bucket}"
      ]
    },
    {
      "Sid": "AllowVPCEAccess",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": [
        "arn:aws:s3:::${bucket}/*",
        "arn:aws:s3:::${bucket}"
      ],
      "Condition": {
        "StringEquals": {
          "aws:sourceVpce": "${vpc_endpoint_id}"
        }
      }
    }
  ]
}
