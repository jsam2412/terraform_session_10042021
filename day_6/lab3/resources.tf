resource "aws_instance" "cloudlogic" {
  ami           = "ami-0bcf5425cdc1d8a85"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld-KR"
  }
}

resource "aws_iam_user" "dummyuser" {
  name = var.iam_user
  path = "/system/"
}
