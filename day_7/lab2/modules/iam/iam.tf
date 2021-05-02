resource "aws_iam_user" "demouser" {
  name = "demouser"
  path = "/users/"
}