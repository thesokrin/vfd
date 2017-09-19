{
  "Version": "2012-10-17",
  "Id": "58a3fd2d-07c1-4303-bf3a-9fb7b95b9200",
  "Statement": [
    {
      "Sid": "AllowListMyBuckets",
      "Effect": "Allow",
      "Action": "s3:ListAllMyBuckets",
      "Resource": "arn:aws:s3:::*"
    },
    {
      "Sid": "AllowListBucket",
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": [
        "arn:aws:s3:::${source_bucket}",
        "arn:aws:s3:::${destination_bucket}"
      ]
    },
    {
      "Sid": "AllowGetBucketInfo",
      "Effect": "Allow",
      "Action": [
        "s3:GetBucketLocation"
      ],
      "Resource": [
        "arn:aws:s3:::${source_bucket}",
        "arn:aws:s3:::${destination_bucket}"
      ]
    },
    {
      "Sid": "AllowReadBucketAccess",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:GetObjectAcl",
        "s3:GetObjectVersionAcl",
        "s3:GetObjectTagging",
        "s3:GetObjectVersionTagging",

        "s3:ListObjects"
      ],
      "Resource": [
        "arn:aws:s3:::${source_bucket}/*",
        "arn:aws:s3:::${destination_bucket}/*"
      ]
    },
    {
      "Sid": "AllowDestinationWriteAccess",
      "Effect": "Allow",
      "Action": [
        "s3:AbortMultipartUpload",
        "s3:ListMultipartUploadParts",
        "s3:PutObject",
        "s3:PutObjectACL",
        "s3:PutObjectTagging",
        "s3:DeleteObject"
      ],
      "Resource": [
        "arn:aws:s3:::${source_bucket}/*",
        "arn:aws:s3:::${destination_bucket}/*"
      ]
    }
  ]
}
