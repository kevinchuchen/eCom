output "username"{
    value = aws_lightsail_instance.ecom_instance.username
}

output "publicIP"{
    value = aws_lightsail_instance.ecom_instance.public_ip_address
}