{
  "Version": "2012-10-17",
  "Id": "4bf0c6a7-67c2-4fc8-a63d-4dc2d1de2650",
  "Statement": [
    {
      "Sid": "DisallowArchiveDeletes",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:DeleteObject",
      "Resource": "arn:aws:s3:::${bucket_name}/${archive_folder_name}*"
    }
  ]
}
