terraform {
  backend "azurerm" {}
}

provider "azurerm" {
  version                    = "=2.8.0"
  skip_provider_registration = true
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}


module "tf" {
  source        = "../module"
  string_length = var.string_length
}