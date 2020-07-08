This repository will create an AWS VPC with multiple private and public networks. Each private network has an associated EIP and a NAT gateway. All subnets are created in different availibility zones when possible.

# Usage:
- clone the repository
- go to the example folder
- fill in your variables and access keys
```
terraform init
terraform plan
terraform apply
```

# ToDo:
- possibly add dependencies between the resources
