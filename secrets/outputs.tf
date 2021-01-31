# outputting this to force dependency on secret creation when bootstrapping for the first time
output rds_password_id {
    value = aws_secretsmanager_secret.rds_password.id
}