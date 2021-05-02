resource "aws_iam_user" "demouser" {
  name = var.username
  path = "/users/"
}