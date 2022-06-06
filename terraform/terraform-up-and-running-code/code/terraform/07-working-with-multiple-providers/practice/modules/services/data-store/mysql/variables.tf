variable "backup_retention_period" {

    description = "Days to retain backups. Must be >0 to enable replication"
    type = number
    default = null
  
}

variable "replicate_source_db" {

    description = "If specified, replicate the RDS database at the tiven ARN"
    type = string
    default = null
  
}

variable "proj_name" {

    description = "Name of the Project"
    type = string 
  
}

variable "env_name" {

    description = "Name of the environment"
  
}

variable "db_name" {

    description = "Name of the DBI"
    type = string

  
}

variable "db_username" {

    description = "Name of the DB user"
    type = string
    sensitive = true
  
}

variable "db_password" {

    description = "DB User password"
    type = string
    sensitive = true
  
}