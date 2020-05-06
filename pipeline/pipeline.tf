terraform {
  backend "azurerm" {}
}

module "tf" {
  source        = "../module"
  string_length = var.string_length
  client_secret = var.client_secret
  instance      = var.instance
  location      = var.location
}