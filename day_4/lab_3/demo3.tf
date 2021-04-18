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

resource "aws_eip" "myeip" {
  vpc = true
}

output "EIP" {
  value = aws_eip.myeip
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "cloudlogic202712"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

output "S3BucketARN" {
  value = aws_s3_bucket.demo_bucket
}
