provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "workshop" {
  name     = "tfworkshop-networking-rg"
  location = "East US"
}

resource "azurerm_virtual_network" "workshop_vnet" {
  name                = "tfworkshop-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.workshop.location
  resource_group_name = azurerm_resource_group.workshop.name
}

resource "azurerm_subnet" "workshop_subnet" {
  name                 = "tfworkshop-subnet"
  resource_group_name  = azurerm_resource_group.workshop.name
  virtual_network_name = azurerm_virtual_network.workshop_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
