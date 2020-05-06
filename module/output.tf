output "my_string" {
  value = random_string.module.result
}

output "bearer1" {
  value = data.external.databricks.result
}

output "bearer2" {
  value = data.external.azureapi.result
}
