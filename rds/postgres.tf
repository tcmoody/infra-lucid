resource aws_db_instance postgres {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "12"
  instance_class       = "db.t2.micro"
  name                 = "infra-lucid-pg"
  username             = "lucid"
  # set via secrets module in aws secrets store
  password             = var.rds_password
  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids
}