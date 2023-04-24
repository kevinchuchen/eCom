output "lightsail-publicIP" {
  value = module.lightsail_instance.publicIP
}
output "lightsail-username" {
  value = module.lightsail_instance.username
}