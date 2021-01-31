resource "aws_security_group" "rds_connection" {
  name        = "rds_connection"
  description = "Allow RDS connectivity between ec2s and RDS"
  vpc_id      = var.vpc_id

  ingress {
    description = "TLS from VPC"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = var.ec2_subnet_cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_rds_connectivity"
  }
}