output "custom_string" {
  value = module.tf.my_string
}

output "bearer1" {
  value = module.tf.bearer1.accessToken
}

output "bearer2" {
  value = module.tf.bearer2.accessToken
}