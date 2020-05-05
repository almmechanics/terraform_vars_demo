data "external" "pwsh" {
  program = ["pwsh", "${path.module}/Invoke-az.ps1"] # azurerm_databricks_workspace.example.location, azurerm_databricks_workspace.example.id]
}