output "custom_string" {
  value = module.tf.my_string
}

output "accessToken1" {
  value = module.tf.bearer1.accessToken
}

output "accessToken2" {
  value = module.tf.bearer2.accessToken
}

output "databricks_bearer" {
  value = module.tf.bearerToken
}