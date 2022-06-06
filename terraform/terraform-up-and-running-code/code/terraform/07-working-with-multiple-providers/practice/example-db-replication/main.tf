terraform {
  required_version = ">= 1.0.0 , < 2.0.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
}
provider "aws" {

    region = "us-east-2"
    alias = "primary"
  
}

provider "aws" {

    region = "us-east-1"
    alias = "replica"
  
}

module "mysql_primary" {
   source = "../modules/services/data-store/mysql"

   providers = {
     aws = aws.primary 
    }

    proj_name = var.proj_name
    env_name = var.env_name
    db_name = var.db_name
    db_username = var.db_username
    db_password = var.db_password

    backup_retention_period = 1
}

module "mysql_replica" {
   source = "../modules/services/data-store/mysql"

   providers = {
     aws = aws.replica 
    }
    proj_name = var.proj_name
    env_name = var.env_name

    db_name = null
    db_username = null
    db_password = null

    replicate_source_db = module.mysql_primary.arn
 
}