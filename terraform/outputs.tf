output "lightsail-publicIP" {
  value = module.lightsail_instance.publicIP
}
output "lightsail-username" {
  value = module.lightsail_instance.username
}

output "lightsail-access-id" {
    value = module.IAM_user.IAM-access-id
}

output "lightsail-access-secret" {
    value = module.IAM_user.IAM-access-secret
    sensitive = true
}