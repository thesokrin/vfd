{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": ${allowed_users}
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
