# Configure the Azure provider
provider "azurerm" {
  features {}
  
  # It's good practice to specify the version of the provider
  # version = "~> 3.0"  # Uncomment and set the version you want to use
}

# Create a resource group using our custom module
module "workshop_rg" {
  source   = "./modules/resource_group"
  name     = "tfworkshop-module-rg"
  location = "East US"
  
  # Add some tags to identify our resource
  tags = {
    Environment = "dev"
    CreatedBy   = "terraform"
    Project     = "workshop"
  }
}

# Output the name of the created resource group
output "resource_group_name" {
  value       = module.workshop_rg.resource_group_name
  description = "The name of the created resource group"
}

# Output the ID of the created resource group
output "resource_group_id" {
  value       = module.workshop_rg.resource_group_id
  description = "The ID of the created resource group"
}

# Example of how to use the module with different inputs
/*
module "another_rg" {
  source   = "./modules/resource_group"
  name     = "another-resource-group"
  location = "West US"
  
  tags = {
    Environment = "test"
    Purpose     = "demonstration"
  }
}
*/
