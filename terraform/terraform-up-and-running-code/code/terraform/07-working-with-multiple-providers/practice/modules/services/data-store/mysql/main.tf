terraform {
  required_version = ">= 1.0.0, < 2.0.0"
  required_providers {
      aws = {
          source = "hashicorp/aws"
          version = "~> 4.0"
      }
  }
}

resource "aws_db_instance" "mysql_dbi" {

    identifier_prefix = "${var.proj_name}-${var.env_name}-mysql-dbi"
    allocated_storage = 10
    instance_class = "db.t2.micro"
    skip_final_snapshot = true

    #enable backups
    backup_retention_period = var.backup_retention_period

    #if specified, this DB will be a replica
    replicate_source_db = var.replicate_source_db

    #Only set these parameters if replicate_source_db is not set.
    engine = var.replicate_source_db == null ? "mysql" : null
    db_name = var.replicate_source_db == null ? var.db_name : null
    username = var.replicate_source_db == null ? var.db_username : null
    password = var.replicate_source_db == null ? var.db_password : null 
  
}
