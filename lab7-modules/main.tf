provider "azurerm" {
  features {}
}

module "workshop_rg" {
  source   = "./modules/resource_group"
  name     = "tfworkshop-module-rg"
  location = "East US"
}

output "module_rg_name" {
  value = module.workshop_rg.resource_group_name
}
