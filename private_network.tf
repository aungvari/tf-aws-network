# private route tables
resource "aws_route_table" "private-route" {
    count = length(var.private_subnets)
    vpc_id = aws_vpc.vpc-module.id
}

# private routes
resource "aws_route" "private-internet-route" {
    count = length(var.private_subnets)
    route_table_id = aws_route_table.private-route[0].id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw[0].id
}

# private subnet
resource "aws_subnet" "private-subnet" {
    count = length(var.private_subnets)
    vpc_id = aws_vpc.vpc-module.id
    cidr_block = element(concat(var.private_subnets, [""]), count.index)
    availability_zone = data.aws_availability_zones.available.names[count.index]
    tags = {
        Name = "${var.name}-private-subnet-${count.index + 1}"
    }
}

# private subnet route association
resource "aws_route_table_association" "private-subnet-association" {
    count = length(var.private_subnets)
    route_table_id = aws_route_table.private-route.*.id[count.index]
    subnet_id = aws_subnet.private-subnet.*.id[count.index]
}