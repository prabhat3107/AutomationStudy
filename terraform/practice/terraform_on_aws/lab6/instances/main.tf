
variable "http_port" {
  description = "The port the server will use for HTTP requests"
  default     = 80
  type        = number
}

variable "https_port" {
  description = "The port the server will use for HTTP requests"
  default     = 443
  type        = number
}


resource "aws_instance" "aws_example" {
  ami           = "ami-0e2c8caa4b6378d8c" # ubuntu 24.04 intel 64 bit
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "${aws_security_group.sg_ssh.id}",
    "${aws_security_group.sg_http.id}",
    "${aws_security_group.sg_https.id}"
  ]

  key_name = "aws_key"

  # user_data = <<-EOF
  #             #!/bin/bash
  #             echo "Hello World!" > index.html
  #             nohup busybox httpd -f -p "${var.server_port}" &
  #             EOF

  user_data = file("../scripts/apache-mkdocs.yaml")

  tags = {
    Name = "ExampleInstance" # Tag the instance with a Name tag for easier identification
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPWLXTR+dNmSNGkP8thSgN9w3alK/GqFPfr6LT1twn7Q prabhat3107@gmail.com"
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
    from_port   = var.http_port
    to_port     = var.http_port
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
resource "aws_security_group" "sg_https" {
  name = "sg_https"
  ingress {
    from_port   = var.https_port
    to_port     = var.https_port
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