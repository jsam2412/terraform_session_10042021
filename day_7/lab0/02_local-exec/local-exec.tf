resource "aws_key_pair" "loginkey" {
  key_name   = "login-key"
  public_key = file("${path.module}/demo-kp.pub")
}

resource "aws_instance" "myec2" {
  ami             = "ami-04b1ddd35fd71475a"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.loginkey.key_name
  security_groups = [aws_security_group.demo_sg.name]

  tags = {
    Name = "HelloWorld-KR"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.myec2.private_ip} >> private_ips.txt"
  }
}

resource "aws_security_group" "demo_sg" {
  name        = "allow_all"
  description = "All traffic allowed"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all"
  }
}