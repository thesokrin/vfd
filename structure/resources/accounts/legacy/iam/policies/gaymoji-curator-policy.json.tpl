{
  "Id": "5365938a-197e-4f53-83ca-f8a67c00dd7c",
  "Version": "2012-10-17",
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
      "Resource": "arn:aws:s3:::${bucket}"
    },
    {
      "Sid": "AllowGetBucketInfo",
      "Effect": "Allow",
      "Action": [
        "s3:GetBucketLocation"
      ],
      "Resource": "arn:aws:s3:::${bucket}"
    },
    {
      "Sid": "ManageBucketACL",
      "Effect": "Allow",
      "Action": [
        "s3:GetBucketAcl",
        "s3:PutBucketAcl"
      ],
      "Resource": "arn:aws:s3:::${bucket}"
    },
    {
      "Sid": "AllowRWBucketAccess",
      "Effect": "Allow",
      "Action": [
        "s3:AbortMultipartUpload",
        "s3:ListMultipartUploadParts",

        "s3:PutObject",
        "s3:PutObjectAcl",
        "s3:PutObjectVersionAcl",
        "s3:PutObjectTagging",

        "s3:GetObject",
        "s3:GetObjectAcl",
        "s3:GetObjectVersionAcl",
        "s3:GetObjectTagging",
        "s3:GetObjectVersionTagging",

        "s3:ListObjects"
      ],
      "Resource": [
        "arn:aws:s3:::${bucket}/${gaymoji_index_file}",
        "arn:aws:s3:::${bucket}/${gaymoji_path}",
        "arn:aws:s3:::${bucket}/${gaymoji_path}*"
      ]
    }
  ]
}
