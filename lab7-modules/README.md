# Lab 7: Using Terraform Modules

## Objective
Learn how to use Terraform modules to organize and reuse code.

---

## Steps

### 1. Navigate to Lab Directory
```sh
cd ../lab7-modules
```

### 2. Create a Simple Local Module
Create a new folder called `modules/resource_group` and add a file `main.tf` inside it:

**modules/resource_group/main.tf**
```hcl
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
```

### 3. Use the Module in Your Root Configuration
Create a `main.tf` in the `lab7-modules` folder:
```hcl
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
```

### 4. Initialize and Apply
```sh
terraform init
terraform apply
```
Type `yes` when prompted.

### 5. Verify in Azure Portal
- Check for the new resource group in the [Azure Portal](https://portal.azure.com/).

---

## Quiz
1. What is a Terraform module?
2. How do you reference an output from a module?
3. Why use modules in Terraform?

---

## Cleanup (Optional)
```sh
terraform destroy
```
Type `yes` when prompted.

---

**Congratulations! You've completed the Terraform Azure Workshop!**
