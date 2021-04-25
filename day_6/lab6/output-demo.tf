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

resource "aws_iam_user" "demo_user" {
  name  = "iamuser-demo.${count.index}"
  count = 3
  path  = "/system/"
}

output "NAME" {
  value = aws_iam_user.demo_user[*].name
}

output "ARN" {
  value = aws_iam_user.demo_user[*].arn
}