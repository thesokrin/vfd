aws_account_id = "284224159432"
aws_region = "us-east-1"

private_route_table_ids = [
  "rtb-947f20f2", "rtb-927f20f4", "rtb-957f20f3", "rtb-827f20e4", "rtb-8a7f20ec", "rtb-837f20e5", "rtb-877f20e1",
  "rtb-847f20e2", "rtb-897f20ef", "rtb-9c7f20fa", "rtb-9f7f20f9", "rtb-9e7f20f8", "rtb-887f20ee", "rtb-857f20e3",
  "rtb-8b7f20ed"
]

aws_account_ids = {
  "dev"  = "202004573189"
  "stg"  = "886703752586"
  "hub"  = "284224159432"
  "prod" = "058144102190"
  "dsci" = "058144102190"
}

cidr_blocks = {
  "dev"  = "10.50.0.0/16"
  "stg"  = "10.51.0.0/16"
  "hub"  = "10.10.0.0/16"
  "prod" = "10.2.0.0/16"
  "dsci" = "10.100.0.0/16"
}

environment_names = {
  "dev"  = "development"
  "stg"  = "staging"
  "hub"  = "hub"
  "prod" = "production"
  "dsci" = "datascience"
}

# DO NOT CHANGE THE ORDER OF THIS LIST; IF YOU DO, YOU WILL BREAK **EVERYTHING**.
# IT CANNOT BE OVERSTATED HOW IMPORTANT IT IS THAT YOU DO NOT, UNDER ANY CIRCUMSTANCES, MODIFY THE ORDER OF THIS LIST.
# IF YOU NEED TO ADD ANOTHER ENVIRONMENT, ADD IT TO THE **END** OF THE LIST AND NOWHERE ELSE.
environments = [
  "dev",
  "stg",
  "prod",
  "dsci"
]

vpc_ids = {
  "dev"  = "vpc-d3de2bb5"
  "stg"  = "vpc-054e9f63"
  "hub"  = "vpc-62e70f04"
  "prod" = "vpc-a5ac3fc3"
  "dsci" = "vpc-36798d50"
}

vpc_peering_connections = {
  "dev"  = "pcx-10178f79"
  "stg"  = "pcx-e1178f88"
  "prod" = "pcx-b8178fd1"
  "dsci" = "pcx-7d74ec14"
}

zones = {
  "dev"  = "dev.grindr.io"
  "stg"  = "stg.grindr.io"
  "hub"  = "hub.grindr.io"
  "prod" = "prod.grindr.io"
  "dsci" = "dsci.grindr.io"
}
