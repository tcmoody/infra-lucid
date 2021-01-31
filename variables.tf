variable name {
  type        = string
  default     = "sam-code-test"
  description = "Root name for resources in this project"
}

variable vpc_cidr {
  default     = "10.1.0.0/16"
  type        = string
  description = "VPC cidr block"
}

variable newbits {
  default     = 8
  type        = number
  description = "How many bits to extend the VPC cidr block by for each subnet"
}

variable public_subnet_count {
  default     = 3
  type        = number
  description = "How many subnets to create"
}

variable private_subnet_count {
  default     = 3
  type        = number
  description = "How many private subnets to create"
}

variable db_subnet_count {
  default     = 3
  type        = number
  description = "How many private subnets to create"
}

variable rds_password_name {
  default     = "rds_password"
  type        = string
  description = "Name for the rds password secret in aws secret storage"
}