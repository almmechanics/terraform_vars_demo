

# resource "azurerm_key_vault_secret" "databricks" {
#   name         = "accesstoken-databricks"
#   value        = data.external.databricks.result.accessToken
#   key_vault_id = azurerm_key_vault.module.id

#   depends_on = [
#     data.external.databricks
#   ]  
# }

# resource "azurerm_key_vault_secret" "azureapi" {
#   name         = "accesstoken-azureapi"
#   value        = data.external.azureapi.result.accessToken
#   key_vault_id = azurerm_key_vault.module.id

#   depends_on = [
#     data.external.azureapi
#   ]  
# } 