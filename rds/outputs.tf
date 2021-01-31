output rds_host {
    value = aws_db_instance.postgres.endpoint
}

output rds_username {
    value = aws_db_instance.postgres.username
}