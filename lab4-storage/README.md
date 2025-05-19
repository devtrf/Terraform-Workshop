# Lab 4: Storage — Deploy a Storage Account & Blob Container

## Objective
Deploy an Azure Storage Account and a Blob Container using Terraform.

---

## Steps

### 1. Navigate to Lab Directory
```sh
cd ../lab4-storage
```

### 2. Create `main.tf`
Paste the following into `main.tf`:
```hcl
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "workshop" {
  name     = "tfworkshop-storage-rg"
  location = "East US"
}

resource "azurerm_storage_account" "workshop_storage" {
  name                     = "tfworkshopstor${random_integer.suffix.result}"
  resource_group_name      = azurerm_resource_group.workshop.name
  location                 = azurerm_resource_group.workshop.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

resource "azurerm_storage_container" "workshop_container" {
  name                  = "tfworkshop-container"
  storage_account_name  = azurerm_storage_account.workshop_storage.name
  container_access_type = "private"
}

output "storage_account_name" {
  value = azurerm_storage_account.workshop_storage.name
}

output "container_name" {
  value = azurerm_storage_container.workshop_container.name
}
```

### 3. Initialize and Apply
```sh
terraform init
terraform apply
```
Type `yes` when prompted.

### 4. Verify in Azure Portal
- Look for the storage account and container in the [Azure Portal](https://portal.azure.com/).

---

## Quiz
1. Why do we use `random_integer` for the storage account name?
2. What is the purpose of a storage container?
3. What does `output` do in Terraform?

---

## Cleanup (Optional)
```sh
terraform destroy
```
Type `yes` when prompted.

---

**Proceed to Lab 5 once you have completed this lab!**
