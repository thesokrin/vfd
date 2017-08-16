{
  "Id": "6cbbe804-8e27-4032-9b17-ac76bb4aec2d",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowGetIdentity",
      "Effect": "Allow",
      "Action": "iam:GetUser",
      "Resource": "arn:aws:iam::${aws_account_id}:user/$${aws:username}"
    },
    {
      "Sid": "AllowListBucket",
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::${bucket}"
    },
    {
      "Sid": "AllowRWBucketAccess",
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:DeleteObject",
        "s3:GetObject",
        "s3:ListObjects"
      ],
      "Resource": "arn:aws:s3:::${bucket}/*"
    }
  ]
}
