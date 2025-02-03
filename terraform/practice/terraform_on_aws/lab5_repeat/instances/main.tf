resource "aws_instance" "lession_05" {
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type   = "t2.micro"
  key_name       = "aws_key"
  vpc_security_group_ids = [
    aws_security_group.sg_ssh.id,
    aws_security_group.sg_http.id,
    aws_security_group.sg_https.id
  ]
  tags = {
    Name = "Lession_05_EC2"
  }
}

resource "aws_key_pair" "my_aws_key" {
  key_name   = "my_aws_key"
  public_key = file("../keys/my_aws_key.pub")
}


resource "aws_security_group" "sg_ssh" {
  name        = "sg_ssh"
  description = "SSH bastion host ssh"
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }
}

resource "aws_security_group" "sg_http" {
  name        = "sg_http"
  description = "HTTP traffic"
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }
}

resource "aws_security_group" "sg_https" {
  name        = "sg_https"
  description = "HTTPS"
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }
}