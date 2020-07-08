# query available zones
data "aws_availability_zones" "available" { 
}

resource "aws_vpc" "vpc-module" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = "${var.name}-vpc"
    }
}

# internet gateway
resource "aws_internet_gateway" "default" {
    count = length(var.public_subnets)
    vpc_id = aws_vpc.vpc-module.id
    tags = {
        Name = "${var.name}-igw-${count.index + 1}"
    }
}