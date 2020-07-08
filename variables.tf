#used as tag and prefix where applicable
variable "name" {}

variable "aws_region" {}

variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "vpc_cidr" {}

variable "ingress_from_port" { default = 0}
variable "ingress_to_port" { default = 0}
variable "ingress_protocol" { default = "-1"}
variable "egress_from_port" { default = 0}
variable "egress_to_port" { default = 0}
variable "egress_protocol" { default = "-1"}


variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}