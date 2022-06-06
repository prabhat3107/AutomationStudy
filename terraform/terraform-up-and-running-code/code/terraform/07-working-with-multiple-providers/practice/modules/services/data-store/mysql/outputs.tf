output "arn" {

    value = aws_db_instance.mysql_dbi.arn
    description = "The ARN of the database"
  
}

output "address" {

    value = aws_db_instance.mysql_dbi.address
    description = "The DB connection endpoint"

  
}

output "port" {

    value = aws_db_instance.mysql_dbi.port
    description = "The DB port"
     
}