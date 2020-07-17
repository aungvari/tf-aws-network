# public route tables
resource "aws_route_table" "public-route" {
    count = length(var.public_subnets)
    vpc_id = aws_vpc.vpc-module.id
}

# public routes
resource "aws_route" "public-internet-route" {
    count = length(var.public_subnets)
    route_table_id = aws_route_table.public-route.*.id[count.index]
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.*.id[count.index]
}

# public subnet
resource "aws_subnet" "public-subnet" {
    count = length(var.public_subnets)
    vpc_id = aws_vpc.vpc-module.id
    cidr_block = element(concat(var.public_subnets, [""]), count.index)
    availability_zone = data.aws_availability_zones.available.names[count.index]
    tags = {
        Name = "${var.name}-public-subnet-${count.index + 1}"
    }
}

# public subnet route association
resource "aws_route_table_association" "public-subnet-association" {
    count = length(var.public_subnets)
    route_table_id = aws_route_table.public-route.*.id[count.index]
    subnet_id = aws_subnet.public-subnet.*.id[count.index]
}
