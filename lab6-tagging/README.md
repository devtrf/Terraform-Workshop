# Lab 6: Tagging and Resource Organization

## Objective
Learn how to use tags and naming conventions to organize Azure resources with Terraform.

---

## Steps

### 1. Navigate to Lab Directory
```sh
cd ../lab6-tagging
```

### 2. Create `main.tf`
Paste the following into `main.tf`:
```hcl
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
```

### 3. Initialize and Apply
```sh
terraform init
terraform apply
```
Type `yes` when prompted.

### 4. Verify in Azure Portal
- Check the resource group for tags and naming in the [Azure Portal](https://portal.azure.com/).

---

## Quiz
1. Why are tags useful in Azure?
2. How can you change the environment for this deployment?
3. What is the naming convention used for the resource group?

---

## Cleanup (Optional)
```sh
terraform destroy
```
Type `yes` when prompted.

---

**Proceed to Lab 7 once you have completed this lab!**
