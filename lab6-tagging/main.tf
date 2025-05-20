# Configure the Azure provider
provider "azurerm" {
  features {}
  
  # It's good practice to specify the version of the provider
  # version = "~> 3.0"  # Uncomment and set the version you want to use
}

# Define input variables
variable "environment" {
  description = "The environment for this deployment (e.g., dev, test, prod)"
  type        = string
  default     = "dev"
  
  # Add validation to ensure only valid environments are used
  validation {
    condition     = contains(["dev", "test", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, test, staging, prod"
  }
}

# Define common tags that will be applied to all resources
locals {
  common_tags = {
    Environment = var.environment
    Owner       = "workshop-user"
    Purpose     = "Terraform Lab 6 - Tagging"
    CreatedBy   = "terraform"
    Project     = "terraform-workshop"
  }
}

# Create a resource group with tags
resource "azurerm_resource_group" "tagged" {
  name     = "tfworkshop-tagged-${var.environment}-rg"
  location = "East US"
  
  # Apply our common tags
  tags = local.common_tags
}

# Output the tags to see what was applied
output "applied_tags" {
  value       = local.common_tags
  description = "The tags that were applied to the resource group"
}
