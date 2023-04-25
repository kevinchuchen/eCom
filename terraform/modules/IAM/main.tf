//creates a lightsail IAM user to assume a role that gives permission to use AWS resources
resource "aws_iam_user" "lightsail-user" { 
  name = "IAM-lightsail-user"
  path = "/system/"

  tags = {
    env = var.env
  }
}
resource "aws_iam_access_key" "IAM-access-key" {
  user    = aws_iam_user.lightsail-user.name
}

data "aws_iam_policy_document" "lightsail-user-policy-document" {
  statement {
    effect  = "Allow"
    actions = [ "ssm:PutParameter",
                "ssm:GetParameterHistory",
                "ssm:GetParametersByPath",
                "ssm:GetParameters",
                "ssm:GetParameter"]
    resources = ["arn:aws:ssm:*:563823215240:parameter/*"]
    # principals {
    #   type        = "Service"
    #   identifiers = ["ec2.amazonaws.com"]
    # }
  }
}
resource "aws_iam_policy" "create_policy" {
  name   = format("%s-lightsail-user-policy", var.env)
  path   = "/"
  policy = data.aws_iam_policy_document.lightsail-user-policy-document.json
}

resource "aws_iam_user_policy_attachment" "attach_policy"{
  user = aws_iam_user.lightsail-user.name
  policy_arn = aws_iam_policy.create_policy.arn
}