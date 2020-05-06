data "external" "databricks" {
  program = ["pwsh", "${path.module}/Invoke-Bearer.ps1", data.azurerm_client_config.current.id, data.azurerm_client_config.current.tenant_id, data.azurerm_client_config.current.client_id, var.client_secret,"DataBricks"]
}

data "external" "azureapi" {
  program = ["pwsh", "${path.module}/Invoke-Bearer.ps1", data.azurerm_client_config.current.id, data.azurerm_client_config.current.tenant_id, data.azurerm_client_config.current.client_id, var.client_secret, "AzureApi"]
}