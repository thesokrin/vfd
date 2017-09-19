{
  "Id": "5365938a-197e-4f53-83ca-f8a67c00dd7c",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "CodePipelineStorage${name}AllowGetIdentity",
      "Effect": "Allow",
      "Action": "iam:GetUser",
      "Resource": "arn:aws:iam::${aws_account_id}:user/$${aws:username}"
    },
    {
      "Sid": "CodePipelineStorage${name}AllowListMyBuckets",
      "Effect": "Allow",
      "Action": "s3:ListAllMyBuckets",
      "Resource": "arn:aws:s3:::*"
    },
    {
      "Sid": "CodePipelineStorage${name}AllowListBucket",
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "${bucket_arn}"
    },
    {
      "Sid": "CodePipelineStorage${name}AllowGetBucketInfo",
      "Effect": "Allow",
      "Action": [
        "s3:GetBucketLocation"
      ],
      "Resource": "${bucket_arn}"
    },
    {
      "Sid": "CodePipelineStorage${name}ManageBucketACL",
      "Effect": "Allow",
      "Action": [
        "s3:GetBucketAcl",
        "s3:PutBucketAcl"
      ],
      "Resource": "${bucket_arn}"
    },
    {
      "Sid": "CodePipelineStorage${name}AllowRWBucketAccess",
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
      "Resource": "${bucket_arn}/${source_folder}*"
    }
  ]
}
