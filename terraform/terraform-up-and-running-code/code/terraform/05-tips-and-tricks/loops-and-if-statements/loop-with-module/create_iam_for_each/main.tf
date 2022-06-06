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
  
}

module "users" {

    source = "../modules/iam"

    for_each = toset(var.user_names )
    user_name = each.value
  
}