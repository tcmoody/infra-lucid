terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

module secrets {
  source = "./secrets"
  rds_password_name = var.rds_password_name
}

module security_groups {
  source = "./security_groups"
  vpc_id = aws_vpc.main.id
  ec2_subnet_cidrs = aws_subnet.private.*.cidr_block
}

module rds {
  source = "./rds"
  rds_password = data.aws_secretsmanager_secret_version.rds_password.secret_string
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = module.security_groups.rds_security_group_ids
}

module ec2 {
  source = "./ec2"
  ec2_subnets = aws_subnet.private.*.id
  lb_subnets = aws_subnet.public.*.id
  ami_id = data.aws_ami.ubuntu.id
  vpc_id = aws_vpc.main.id
  rds_host = module.rds.rds_host
  rds_username = module.rds.rds_username
  rds_password = data.aws_secretsmanager_secret_version.rds_password.secret_string
}