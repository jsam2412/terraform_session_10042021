resource "aws_instance" "myec2" {
  ami                    = "ami-045e6fa7127ab1ac4"
  instance_type          = "t2.medium"
  vpc_security_group_ids = ["sg-0f5c00301518796c0"]
  key_name               = "demo-kp"
  subnet_id              = "subnet-5e1c5e12"

  tags = {
    Name = "manual-demo"
  }
}


