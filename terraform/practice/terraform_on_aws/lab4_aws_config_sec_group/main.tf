terraform {
  required_version = "~> 1.0" # Ensure that the Terraform version is 1.0 or higher

  required_providers {
    aws = {
      source = "hashicorp/aws" # Specify the source of the AWS provider
      version = "~> 5.0"        # Use a version of the AWS provider that is compatible with version
    }
  }
}

provider "aws" {
  region = "us-east-1" # Set the AWS region to US East (N. Virginia)
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default     = 8080
  type = number
}

resource "aws_instance" "aws_example" {
  ami = "ami-0e2c8caa4b6378d8c" # ubuntu 24.04 intel 64 bit
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "${aws_security_group.sg_ssh.id}",
    "${aws_security_group.sg_http.id}"
  ]

  key_name = "pp_terraform_ssh_key"

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello World!" > index.html
              nohup busybox httpd -f -p "${var.server_port}" &
              EOF

  tags = {
    Name = "ExampleInstance" # Tag the instance with a Name tag for easier identification
  }
}

resource "aws_security_group" "sg_ssh" {
  name = "sg_ssh"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "sg_http" {
  name = "sg_http"
  ingress {
    from_port   = "${var.server_port}"
    to_port     = "${var.server_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}
output "public_ip" {
   value = "${aws_instance.aws_example.public_ip}"
}