terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

}


resource "aws_instance" "pp_linux_instance" {
  ami = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
}
