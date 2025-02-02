###### objectives ######
# configure AWS security group
#######

resource "aws_instance" "lab2" {
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type     = "t2.micro"
  vpc_security_group_ids = [
    aws_security_group.sg_http.id,
    aws_security_group.sg_http.id
  ]
  user_data = <<-EOF
            #!/bin/bash
            echo "Hello World!" > index.html
            nohup busybox httpd -f -p "${var.server_port}" &
            EOF
  tags = {
    Name = "lab2-vm-sg-demo"
  }
}

resource "aws_security_group" "sg_ssh" {
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }
}


resource "aws_security_group" "sg_http" {
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }
}



