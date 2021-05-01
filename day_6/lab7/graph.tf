terraform {
  required_version = "0.14.10"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "=3.36.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0bcf5425cdc1d8a85"
  instance_type = "t2.micro"
}

resource "aws_eip" "lb" {
  instance = aws_instance.myec2.id
  vpc      = true
}

resource "aws_security_group" "allow_tls" {
  name = "allow_tls"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb.private_ip}/32"]

  }
}