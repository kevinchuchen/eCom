//creates a lightsail IAM user to assume a role that gives permission to use AWS resources
resource "aws_iam_user" "lightsail-user" { 
  name = "lightsail-user"
  path = "/system/"

  tags = {
    env = var.env
  }
}