{
  "Version": "2012-10-17",
  "Id": "348d21ca-d459-4f42-b2cb-7b6b5afed861",
  "Statement": [
    {
      "Sid": "AllowCrossAccountAccess",
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "arn:aws:iam::${aws_account_dev}:root",
          "arn:aws:iam::${aws_account_staging}:root",
          "arn:aws:iam::${aws_account_preprod}:root",
          "arn:aws:iam::${aws_account_2_0}:root",
          "arn:aws:iam::${aws_account_3_0}:root"
        ]
      },
      "Action": [
        "s3:AbortMultipartUpload",
        "s3:DeleteObject",
        "s3:GetBucketAcl",
        "s3:GetBucketPolicy",
        "s3:GetObject",
        "s3:GetObjectAcl",
        "s3:ListBucket",
        "s3:ListBucketMultipartUploads",
        "s3:ListMultipartUploadParts",
        "s3:PutObject",
        "s3:PutObjectAcl"
      ],
      "Resource": [
        "arn:aws:s3:::isre.grindr.io/*",
        "arn:aws:s3:::isre.grindr.io"
      ]
    }
  ]
}
