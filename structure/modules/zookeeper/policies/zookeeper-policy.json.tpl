{
  "Version": "2012-10-17",
  "Id": "c7ba03eb-b5ac-4e58-ae17-bc25ab23d0ad",
  "Statement": [
    {
      "Sid": "AllowExhibitorS3RW",
      "Effect": "Allow",
      "Action": [
        "s3:AbortMultipartUpload",
        "s3:DeleteObject",
        "s3:GetObject",
        "s3:GetObjectAcl",
        "s3:ListBucket",
        "s3:ListBucketMultipartUploads",
        "s3:ListMultipartUploadParts",
        "s3:PutObject"
      ],
      "Resource": [
        "arn:aws:s3:::${bucket_name}/*",
        "arn:aws:s3:::${bucket_name}"
      ]
    }
  ]
}
