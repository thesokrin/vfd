{
  "Version": "2012-10-17",
  "Id": "Policy1466641017328",
  "Statement": [
    {
      "Sid": "AllowCrossAccountAccess",
      "Effect": "Allow",
      "Principal": {
        "AWS": ${aws_accounts}
      },
      "Action": "s3:*",
      "Resource": [
        "arn:aws:s3:::apt.grindr.io/*",
        "arn:aws:s3:::apt.grindr.io"
      ]
    },
    {
      "Sid": "AllowVPCEAccess",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": [
        "arn:aws:s3:::apt.grindr.io/*",
        "arn:aws:s3:::apt.grindr.io"
      ],
      "Condition": {
        "StringEquals": {
          "aws:sourceVpce": ${aws_vpces}
        }
      }
    }
  ]
}
