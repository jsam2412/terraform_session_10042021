module "ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name           = "my-demo"
  instance_count = 1

  ami           = "ami-04b1ddd35fd71475a"
  instance_type = "t2.micro"
  subnet_id     = "subnet-5e1c5e12"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}