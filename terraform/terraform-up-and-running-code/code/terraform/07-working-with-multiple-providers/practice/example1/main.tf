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

    region = "us-east-1"
    alias = "region_use_1"
  
}

provider "aws" {
    region = "us-east-2"
    alias = "region_use_2"
}


data "aws_region" "region_1" {

    provider = aws.region_use_1
  
}

data "aws_region" "region_2" {

    provider = aws.region_use_2
  
}

data "aws_ami" "ubuntu_20_04_region_1" {

    provider = aws.region_use_1
    most_recent = true
    owners = ["099720109477"]

    filter {
      name = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
  
}

data "aws_ami" "ubuntu_20_04_region_2" {

    provider = aws.region_use_2

    most_recent = true
    owners = ["099720109477"]

    filter {
      name = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
  
}

resource "aws_instance" "inst1_region1" {

    provider = aws.region_use_1

    ami = data.aws_ami.ubuntu_20_04_region_1.id
    instance_type = "t2.micro"
  
}

resource "aws_instance" "inst1_region2" {

    provider = aws.region_use_2

    ami = data.aws_ami.ubuntu_20_04_region_2.id
    instance_type = "t2.micro"
  
}

