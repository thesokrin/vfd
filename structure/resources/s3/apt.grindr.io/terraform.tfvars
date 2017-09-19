# Atlas S3 Resources - APT Bucket Resources - State Variables
# 2.0 account id
aws_account_id = "284224159432"

aws_region = "us-east-1"

aws_accounts = {
  "dev"     = "780453558463"
  "staging" = "886703752586"
  "preprod" = "202004573189"
  "2.0"     = "284224159432"
  "3.0"     = "058144102190"
}

logging_bucket = "bucket-logs.grindr.io"

logging_bucket_prefix = "apt.grindr.io/logs/"

vpc_endpoint_ids = {
  "hub"            = "vpce-68c40401"
  "development"    = "vpce-a5d111cc"
  "staging"        = "vpce-072cef6e"
  "datascience"    = "vpce-dddd1db4"
  "production"     = "vpce-b92ae6d0"
  "RealProduction" = "vpce-7daf0414"
}
