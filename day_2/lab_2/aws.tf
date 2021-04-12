terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "ap-south-1"
  access_key = "XXXXXXXXXXXXXXXXXXXXXXXX"
  secret_key = "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
}


resource "aws_instance" "cloudlogicec2" {
  ami           = "ami-0bcf5425cdc1d8a85"
  instance_type = "t2.micro"
  count         = 3

  tags = {
    Name = "HelloWorld-Cloudlogic"
  }
}