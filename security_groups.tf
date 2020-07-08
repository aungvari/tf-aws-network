# default sec group
resource "aws_security_group" "default-sg" {
    name = "${var.name}-secgroup"
    vpc_id = aws_vpc.vpc-module.id
}

# ingress rules
resource "aws_security_group_rule" "incoming" {
    security_group_id = aws_security_group.default-sg.id
    from_port = var.ingress_from_port
    to_port = var.ingress_to_port
    protocol = var.ingress_protocol
    type = "ingress"
    cidr_blocks = ["0.0.0.0/0"]
}

# egress rules
resource "aws_security_group_rule" "outgoing" {
    security_group_id = aws_security_group.default-sg.id
    from_port = var.egress_from_port
    to_port = var.egress_to_port
    protocol = var.egress_protocol
    type = "egress"
    cidr_blocks = ["0.0.0.0/0"]
}