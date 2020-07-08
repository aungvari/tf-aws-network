module "vpc" {
    source = "../"

    name = "test"

    aws_region = "eu-central-1"
    aws_access_key = ""
    aws_secret_key = ""

    vpc_cidr = "10.0.0.0/20"

    ingress_from_port = 80
    ingress_to_port = 80
    ingress_protocol = "tcp"
    egress_from_port = 0
    egress_to_port = 0
    egress_protocol = "tcp"

    public_subnets = ["10.0.10.0/24", "10.0.20.0/24"]
    private_subnets = ["10.0.200.0/24", "10.0.201.0/24"]
}
