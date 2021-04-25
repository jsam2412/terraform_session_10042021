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
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
  default = "ap-south-1"
}

variable "tags" {
  type    = list(any)
  default = ["firstec2", "secondec2", "thirdec2"]
}

variable "ami" {
  type = map(any)
  default = {
    "us-east-1"  = "ami-0be2609ba883822ec"
    "us-west-2"  = "ami-0a36eb8fadc976275"
    "ap-south-1" = "ami-0bcf5425cdc1d8a85"
  }
}

resource "aws_key_pair" "loginkey" {
  key_name   = "login-key"
  public_key = file("${path.module}/demo-kp.pub")
}

resource "aws_instance" "app-dev" {
  ami           = lookup(var.ami, var.region)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.loginkey.key_name
  count         = length(var.tags)

  tags = {
    Name = element(var.tags, count.index)
  }
}

output "timestamp" {
  value = local.time
}