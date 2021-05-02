variable "instance_type" {
  type = map(any)
  default = {
    default = "t2.small"
    dev     = "t2.micro"
    prod    = "t2.large"
  }
}

resource "aws_instance" "cloudlogic" {
  ami           = "ami-04b1ddd35fd71475a"
  instance_type = lookup(var.instance_type, terraform.workspace)

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name = "HelloWorld-KR"
  }
}