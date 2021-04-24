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
  region     = "ap-south-1"
  access_key = "XXXXXXXXXXXXXXXXXXXXX"
  secret_key = "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
}

resource "aws_security_group" "demo" {
  name = "CL-variables"

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    # cidr_blocks = ["116.70.40.50/32"]
    cidr_blocks = ["${var.vpn_ip}/32"]
  }

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    # cidr_blocks = ["116.70.40.50/32"]
    cidr_blocks = ["${var.vpn_ip}/32"]
  }

  ingress {
    from_port = 53
    to_port   = 53
    protocol  = "tcp"
    # cidr_blocks = ["116.70.40.50/32"]
    cidr_blocks = ["${var.vpn_ip}/32"]
  }
}

