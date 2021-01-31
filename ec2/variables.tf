variable vpc_id {
    type = string
    description = "VPC Id. Self-explanatory"
}

variable lb_subnets {
    type = list(string)
    description = "list of subnet ids for load balancers to deploy into"
}

variable ec2_subnets {
    type = list(string)
    description = "list of subnet ids for autoscaling group to deploy into"
}

variable ami_id {
    type = string
    description = "ami id for autoscaling"
}

variable rds_host {
    type = string
    description = "DNS for rds"
}

variable rds_username {
    type = string
    description = "username for postgres"
}

variable rds_password {
    type = string
    description = "password for postgres"
}