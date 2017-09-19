{
  "Version": "2012-10-17",
  "Id": "4bf0c6a7-67c2-4fc8-a63d-4dc2d1de2650",
  "Statement": [
    {
      "Sid": "InternalReadGetObject",
      "Effect": "Allow",
      "Principal": {
        "AWS": "${account_id}"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${bucket_name}/*"
    }
  ]
}
