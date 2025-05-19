provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "workshop" {
  name     = "tfworkshop-storage-rg"
  location = "East US"
}

resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

resource "azurerm_storage_account" "workshop_storage" {
  name                     = "tfworkshopstor${random_integer.suffix.result}"
  resource_group_name      = azurerm_resource_group.workshop.name
  location                 = azurerm_resource_group.workshop.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "workshop_container" {
  name                  = "tfworkshop-container"
  storage_account_name  = azurerm_storage_account.workshop_storage.name
  container_access_type = "private"
}

output "storage_account_name" {
  value = azurerm_storage_account.workshop_storage.name
}

output "container_name" {
  value = azurerm_storage_container.workshop_container.name
}
