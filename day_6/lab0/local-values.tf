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

locals {
  common_tags = {
    Owner   = "DevOps Team"
    Service = "backend"
  }
}

resource "aws_instance" "app-dev" {
  ami           = "ami-0bcf5425cdc1d8a85"
  instance_type = "t2.micro"
  tags          = local.common_tags
}

resource "aws_instance" "db-dev" {
  ami           = "ami-0bcf5425cdc1d8a85"
  instance_type = "t2.small"
  tags          = local.common_tags
}

resource "aws_ebs_volume" "db_ebs" {
  availability_zone = "ami-0bcf5425cdc1d8a85"
  size              = 8
  tags              = local.common_tags
}