variable vpc_id {
    type = string
    description = "VPC Id. Self-explanatory"
}

variable ec2_subnet_cidrs {
    type = list(string)
    description = "List of subnet cidrs where ec2s are deployed"
}