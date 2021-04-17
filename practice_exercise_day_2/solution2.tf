terraform {
  required_version = "0.14.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = "XXXXXXXXXXXXXXXXXXXXX"
  secret_key = "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
}

resource "aws_instance" "cloudlogicec2" {
  ami             = "ami-04b1ddd35fd71475a"
  instance_type   = "t2.micro"
  key_name        = "cloudsol2"
  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "PracticeEC2-sol2"
  }
}

resource "aws_key_pair" "cloudkey_sol2" {
  key_name   = "cloudsol2"
  public_key = "ssh-rsa AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA cloudlogic20@DESKTOP-OGFFQRP"
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow TLS inbound traffic"

  ingress {
    description = "SSH from from home IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["223.190.60.90/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_eip" "eip_sol2" {
  instance = aws_instance.cloudlogicec2.id
  vpc      = true
}