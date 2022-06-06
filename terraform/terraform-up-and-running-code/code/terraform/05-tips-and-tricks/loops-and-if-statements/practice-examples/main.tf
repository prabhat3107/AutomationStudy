terraform {
    required_version = ">= 1.0.0, < 2.0.0"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.0"
        }
    }
}

provider "aws" {

    region = var.aws_region
  
}

data "aws_availability_zones" "all" {
  
}

variable "aws_region" {

    description = "Name of the AWS region"
    type = string
    default = "us-east-2"
  
}

resource "aws_instance" "example_2" {

    count = length(data.aws_availability_zones.all.names)
    availability_zone = data.aws_availability_zones.all.names[count.index]
    ami = "ami-0fb653ca2d3203ac1"
    instance_type = "t2.micro"
  
}

output "availablity_zone_names" {

    description = "Print the Name of the availablity zones in AWS region"
    value = data.aws_availability_zones.all.names
  
}
