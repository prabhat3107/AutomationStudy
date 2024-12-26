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

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type = number
  default     = 8090
}

variable "node_count" {
  description = "Number of nodes to create"
  type        = number
  default     = 5
}

resource "aws_instance" "pp_linux_instance" {
  ami                    = "ami-0e2c8caa4b6378d8c"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.terraform_instances.id}"]
  key_name = "pp_terraform_ssh_key"

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello World!" > index.html
              nohup busybox httpd -f -p "${var.server_port}" &
              EOF
  tags = {
    Name = "terraform-example"
  }
}

resource "aws_security_group" "terraform_instances" {
  name = "terraform-example-instance"
  ingress {
    from_port   = "${var.server_port}"
    to_port     = "${var.server_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# output "public_ip" {
#   value = "${aws_instance.pp_linux_instance.public_ip}"
# }