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

variable "types" {
  type = map
  default = {
    us-east-1      = "t2.micro"
    ap-south-1     = "t2.nano"
    ap-southeast-1 = "t2.small"
  }
}

variable "list" {
  type    = list
  default = ["t2.micro", "t2.nano", "t2.small"]
}

resource "aws_instance" "cloudlogic" {
  ami = "ami-08e0ca9924195beba"
  instance_type = var.types["ap-south-1"]
  # instance_type = var.list[2]

  tags = {
    Name = "HelloWorld-KR"
  }
}

