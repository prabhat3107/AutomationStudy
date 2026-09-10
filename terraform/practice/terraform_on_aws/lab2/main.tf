terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default     = 8080
  type        = number
}

# launch configuration has been depricated as of Oct 2024
# recommended to use launch templates
# resource "aws_launch_configuration" "pp_launch_configuration" {
#   image_id        = "ami-0e2c8caa4b6378d8c"
#   instance_type   = "t2.micro"
#   security_groups = ["${aws_security_group.instance.id}"]
#   key_name        = "prabhat_terraform_ssh_key"
#
#   user_data = <<-EOF
#               #!/bin/bash
#               echo "Hello, World" > index.html
#               nohup busybox httpd -f -p "${var.server_port}" &
#               EOF
#   lifecycle {
#     create_before_destroy = true
#   }
# }

resource "aws_launch_template" "pp_launch_template" {
  name = "pp_launch_template"
  description              = "This is an example launch template"
  image_id                = "ami-0e2c8caa4b6378d8c"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
  key_name               = "pp_terraform_ssh_key"
  user_data = base64encode( <<-EOF
            #!/bin/bash
            echo "Hello, World from `hostname`. Please refresh me" > index.html
            nohup busybox httpd -f -p "${var.server_port}" &
            EOF
           )

  ebs_optimized = true
  update_default_version = true

  monitoring {
    enabled = true
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "terraform_created_instance"
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}



resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  lifecycle {
    create_before_destroy = true
  }
}


data "aws_availability_zones" "available" {}

resource "aws_autoscaling_group" "prod_app" {
  name                 = "prod-app-autoscaling"

  launch_template {
    id      = "${aws_launch_template.pp_launch_template.id}"
    version = "${aws_launch_template.pp_launch_template.latest_version}"
  }
  availability_zones   = ["${data.aws_availability_zones.available.names[0]}", "${data.aws_availability_zones.available.names[1]}"]

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
    triggers = [ /*"launch_template",*/ "desired_capacity" ]
  }

  load_balancers    = ["${aws_elb.elb_example.name}"]
  health_check_type = "ELB"

  min_size = 2
  max_size = 10

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "terraform-ecs-asg-example"
  }
}

resource "aws_elb" "elb_example" {
  name               = "terraform-elb-example"
  availability_zones = ["${data.aws_availability_zones.available.names[0]}", "${data.aws_availability_zones.available.names[1]}"]
  security_groups    = ["${aws_security_group.elb_sg.id}"]
  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = var.server_port
    instance_protocol = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "HTTP:${var.server_port}/"
  }
}

resource "aws_security_group" "elb_sg" {
  name = "terraform-elb-security-group"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "elb_dns_name" {
  value = aws_elb.elb_example.dns_name
}
output "elb_zone_id" {
  value = aws_elb.elb_example.zone_id
}