output "arn" {

    value = aws_db_instance.mysql_dbi.arn
    description = "The ARN of the database"
  
}