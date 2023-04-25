locals{
  dev    = var.env == "eCom-dev" ? "eCom-dev-keypair" : ""
  prod 	 = var.env == "eCom-prod" ? "eCom-prod-keypair" : ""
  keypair = coalesce(local.dev,local.prod)
}
# Create a new Lightsail Instance
resource "aws_lightsail_instance" "ecom_instance" {
  
  name              = format("%s-lightsail", var.env)
  availability_zone = var.avail_zone
  blueprint_id      = "wordpress"
  bundle_id         = "nano_2_0"
  key_pair_name     = local.keypair
  user_data         = "sudo wp plugin install woocommerce --activate"
  tags = {
    env = var.env
  }
}

