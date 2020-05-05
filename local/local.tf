terraform {
  backend "local" {}
}

module "tf" {
  source        = "../module"
  string_length = var.string_length
}