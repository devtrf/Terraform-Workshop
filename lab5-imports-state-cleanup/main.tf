provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "imported" {
  name     = "tfworkshop-import-rg"
  location = "East US"
}
