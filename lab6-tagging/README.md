# Lab 6: Tagging and Resource Organization

## Objective
Learn how to use tags, locals, and naming conventions to organize Azure resources with Terraform.

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

resource "azurerm_resource_group" "tagged" {
  name     = "tfworkshop-tagged-${var.environment}-rg"
  location = "East US"
  
  # Apply our common tags
  tags = local.common_tags
}

output "applied_tags" {
  value       = local.common_tags
  description = "The tags that were applied to the resource group"
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
- Verify that all tags from the `common_tags` local are applied.

---

## Key Concepts

### Using Locals for Tags
- The `locals` block defines a map of common tags that can be reused across multiple resources
- This approach ensures consistency and makes it easy to update tags in one place
- The `common_tags` local includes metadata like environment, owner, and project information

### Environment Validation
- The environment variable includes validation to ensure only specified values are used
- This helps prevent typos and enforces consistent environment naming

### Outputs
- The `applied_tags` output shows exactly which tags were applied to the resource group
- This is useful for verification and documentation purposes

---

## Quiz
1. What is the benefit of using a `locals` block for tags instead of defining them directly in each resource?
2. How does the validation on the `environment` variable improve the configuration?
3. How would you add a new tag to all resources that use the `common_tags` local?

---

## Cleanup
When you're done, destroy the resources to avoid unnecessary charges:
```sh
terraform destroy
```
Type `yes` when prompted to confirm the destruction of resources.

---

**Proceed to Lab 7 once you have completed this lab!**
