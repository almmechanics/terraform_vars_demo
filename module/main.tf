provider "azurerm" {
  version                    = "=2.8.0"
  skip_provider_registration = true
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

data "azurerm_client_config" "current" {}

resource "random_string" "module" {
  length  = var.string_length
  override_special = "-_"
  keepers = {
    # Generate a new integer each time we switch to a new listener ARN
    instance = var.instance
  }
}


resource "azurerm_resource_group" "module" {
  name     = format("rg_datbricks_%s", random_string.module.result)
  location = var.location
}