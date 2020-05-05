output "my_string" {
  value = random_string.demo.result
}

output "pwsh" {
  value = data.external.pwsh.result
}
