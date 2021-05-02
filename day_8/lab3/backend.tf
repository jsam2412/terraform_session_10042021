terraform {
  backend "s3" {
    bucket         = "cloudlogic20-tfstate"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "s3-state-lock"
  }
}
