data aws_availability_zones current {}

# data lookup to secret resource name to force dependency on secret creation when bootstrapping for the first time

data aws_secretsmanager_secret_version rds_password {
  secret_id = module.secrets.rds_password_id
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}