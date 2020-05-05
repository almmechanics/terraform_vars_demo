provider "azurerm" {
  version                    = "=2.8.0"
  skip_provider_registration = true
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

data "azurerm_client_config" "current" {
}

resource "random_string" "demo" {
  length  = var.string_length
}
