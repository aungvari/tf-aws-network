# create VPC endpoint for internal s3 traffic
data "aws_vpc_endpoint_service" "s3" {
  service = "s3"
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id = aws_vpc.vpc-module.id
  service_name = data.aws_vpc_endpoint_service.s3.service_name
  vpc_endpoint_type = "Gateway"
}

resource "aws_vpc_endpoint_route_table_association" "private_s3" {
  count = length(var.private_subnets)
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  route_table_id  = aws_route_table.private-route.*.id[count.index]
}
