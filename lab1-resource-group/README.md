# Lab 1: Terraform Basics & Azure Resource Group

## Objective
Learn the basics of Terraform by deploying your first Azure Resource Group.

---

## Steps

### 1. Create a New Directory
```sh
mkdir lab1-resource-group
cd lab1-resource-group
```

### 2. Create `main.tf`
Paste the following into a new file called `main.tf`:
```hcl
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "workshop" {
  name     = "tfworkshop-rg"
  location = "East US"
}
```

### 3. Initialize Terraform
```sh
terraform init
```

### 4. Apply the Configuration
```sh
terraform apply
```
Type `yes` when prompted.

### 5. Verify in Azure Portal
- Go to the [Azure Portal](https://portal.azure.com/)
- Search for "Resource groups" and find `tfworkshop-rg` in "East US"

---

## Quiz
1. What command initializes a Terraform project?
2. What is a resource group in Azure?
3. What does `terraform apply` do?

---

## Cleanup (Optional)
To remove the resource group:
```sh
terraform destroy
```
Type `yes` when prompted.

---

**Proceed to Lab 2 once you have completed this lab!**
