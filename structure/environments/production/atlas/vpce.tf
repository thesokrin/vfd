resource "aws_vpc_endpoint" "prod_vpce" {
    vpc_id = "vpc-8af345ef"
    service_name = "com.amazonaws.us-east-1.s3"
    route_table_ids = ["rtb-d3bc08b6"]
}
