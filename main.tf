terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile = "terraform-tutorial"
  region  = "us-east-1"
}

resource "aws_security_group" "tutorial" {
  name        = "tutorial"
  description = "this is tutorial security group"
  vpc_id      = "vpc-35ebe14f"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["61.87.42.151/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "app_server" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }

  vpc_security_group_ids = [aws_security_group.tutorial.id]
}
