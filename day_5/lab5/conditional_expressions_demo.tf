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

variable "istest" {}

resource "aws_instance" "dev" {
  ami           = "ami-0bcf5425cdc1d8a85"
  instance_type = "t2.micro"
  count         = var.istest == true ? 3 : 0
}

resource "aws_instance" "prod" {
  ami           = "ami-0bcf5425cdc1d8a85"
  instance_type = "t2.large"
  count         = var.istest == false ? 3 : 0
}