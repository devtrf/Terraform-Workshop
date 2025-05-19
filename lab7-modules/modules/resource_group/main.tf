variable "name" {
  type = string
}

variable "location" {
  type = string
  default = "East US"
}

resource "azurerm_resource_group" "this" {
  name     = var.name
  location = var.location
}

output "resource_group_name" {
  value = azurerm_resource_group.this.name
}
