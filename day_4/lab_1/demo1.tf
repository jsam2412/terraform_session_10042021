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

resource "aws_instance" "web" {
  ami           = "ami-0bcf5425cdc1d8a85"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_eip" "myeip" {
  vpc = true
}

resource "aws_iam_user" "demouser" {
  name = "demouser"
  path = "/system/"
}