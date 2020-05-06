resource "azurerm_databricks_workspace" "module" {
  name                = format("databricks-%03d", var.instance)
  resource_group_name = azurerm_resource_group.module.name
  location            = azurerm_resource_group.module.location
  sku                 = "trial"
}

data "external" "init_bearer" {
  program = ["pwsh", "${path.module}/Initialize-BearerToken.ps1", azurerm_databricks_workspace.module.location, azurerm_databricks_workspace.module.id, data.external.databricks.result.accessToken, data.external.azureapi.result.accessToken]
  depends_on = [
    azurerm_databricks_workspace.module,
        data.external.databricks, 
    data.external.azureapi,
  ]
}


data "http" "databricks_bearer_token" {
  url = format("https://%s.azuredatabricks.net/api/2.0/token/list",azurerm_databricks_workspace.module.location)
  request_headers = {
    Accept = "application/json"
    Authorization =format("Bearer %s",data.external.databricks.result.accessToken)
    X-Databricks-Azure-SP-Management-Token =data.external.databricks.result.accessToken
    X-Databricks-Azure-Workspace-Resource-Id =azurerm_databricks_workspace.module.id
  }

  depends_on = [
    data.external.init_bearer
  ]  
}

locals {
  bearer_token = (jsondecode(data.http.databricks_bearer_token.body)).token_infos[0].token_id
}


resource "azurerm_key_vault_secret" "bearerToken" {
  name         = "accesstoken-databricks"
  value        = local.bearer_token
  key_vault_id = azurerm_key_vault.module.id

  depends_on = [
    data.http.databricks_bearer_token,
    azurerm_key_vault.module
  ]  
}