# Input variable for the resource group name
variable "name" {
  type        = string
  description = "The name of the resource group"
}

# Input variable for the Azure region
variable "location" {
  type        = string
  default     = "East US"
  description = "The Azure region where the resource group will be created"
}

# Input variable for tags
variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to apply to the resource group"
}

# Create an Azure Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.name
  location = var.location
  tags     = var.tags
}

# Output the resource group name
output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "The name of the created resource group"
}

# Output the resource group ID
output "resource_group_id" {
  value       = azurerm_resource_group.rg.id
  description = "The ID of the created resource group"
}
