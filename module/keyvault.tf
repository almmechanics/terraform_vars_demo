resource "azurerm_key_vault" "module" {
  name                = format("kv%03s%03d", random_string.module.result, var.instance)
  location            = azurerm_resource_group.module.location
  resource_group_name = azurerm_resource_group.module.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

}

resource "azurerm_key_vault_access_policy" "module" {
  key_vault_id = azurerm_key_vault.module.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id

  secret_permissions = [
    "set", "get", "delete", "list"
  ]
}