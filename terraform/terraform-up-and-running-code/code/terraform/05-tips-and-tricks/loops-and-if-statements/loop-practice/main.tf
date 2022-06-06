terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


provider "aws" {

    region = "us-east-2"
  
}


resource "aws_iam_user" "iam_users" {
    #using count
    #count = length(var.user_names)
    #name = var.user_names[count.index]
  
    for_each = toset(var.user_names)
    name = each.value

}

