resource "aws_instance" "demoec2" {
  ami           = "ami-04b1ddd35fd71475a"
  instance_type = var.instance_type
}

