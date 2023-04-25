resource "aws_ssm_parameter" "IAM-access-ID" {
  name  = "/lightsail-instance/ACCESS-ID"
  type  = "String"
  value = var.IAM-access-ID
}

resource "aws_ssm_parameter" "IAM-access-secret" {
  name  = "/lightsail-instance/ACCESS-SECRET"
  type  = "SecureString"
  value = var.IAM-access-secret
  tags = {
    env = var.env
  }
}