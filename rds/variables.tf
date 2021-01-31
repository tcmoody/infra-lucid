variable rds_password {
    type = string
    description = "rds password"
}
variable db_subnet_group_name {
    type = string
    description = "name for subnets that host rds"
}
variable vpc_security_group_ids {
    type = list(string)
    description = "security groups for rds"
}