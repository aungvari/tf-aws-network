# NAT resources
resource "aws_eip" "nat" {
    count = length(var.private_subnets)
    vpc = true
}

resource "aws_nat_gateway" "nat-gw" {
    count = length(var.private_subnets)
    allocation_id = aws_eip.nat.*.id[count.index]
    subnet_id = aws_subnet.private-subnet.*.id[count.index]
    tags = {
    Name = "${var.name}-nat-gw-${count.index + 1}"
    }
}
