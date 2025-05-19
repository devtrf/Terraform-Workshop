provider "azurerm" {
  features {}
}

variable "environment" {
  description = "The environment for this deployment (e.g., dev, test, prod)"
  type        = string
  default     = "dev"
}

resource "azurerm_resource_group" "tagged" {
  name     = "tfworkshop-tagged-${var.environment}-rg"
  location = "East US"
  tags = {
    Environment = var.environment
    Owner       = "workshop-user"
    Purpose     = "Terraform Lab 6"
  }
}
