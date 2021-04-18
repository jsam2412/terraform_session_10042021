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
  ami           = "ami-08f63db601b82ff5f"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld-KR"
  }
}

resource "aws_eip" "demoeip" {
  vpc = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = data.aws_instance.test.id
  allocation_id = aws_eip.demoeip.id
}

data "aws_instances" "test" {
  instance_tags = {
    Role = "HardWorker"
  }

  filter {
    name   = "instance.group-id"
    values = ["sg-12345678"]
  }

  instance_state_names = ["running", "stopped"]
}
