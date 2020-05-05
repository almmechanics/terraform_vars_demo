data "external" "pwsh" {
  program = ["pwsh", "${path.module}/Invoke-az.ps1", data.azurerm_client_config.current.id, data.azurerm_client_config.current.tenant_id, data.azurerm_client_config.current.client_id, var.client_secret]
}