# Lab 5: Imports, State, and Clean-Up

## Objective
Learn how to import existing Azure resources into Terraform, understand the state file, and clean up resources.

---

## Steps

### 1. Navigate to Lab Directory
```sh
cd ../lab5-imports-state-cleanup
```

### 2. Review Existing Resource
- Use the Azure Portal to create a new resource group named `tfworkshop-import-rg` in "East US" (do this manually).

### 3. Create `main.tf` for Import
Paste the following into `main.tf`:
```hcl
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "imported" {
  name     = "tfworkshop-import-rg"
  location = "East US"
}
```

### 4. Initialize Terraform
```sh
terraform init
```

### 5. Import the Resource
Replace `<subscription_id>` with your Azure subscription ID:
```sh
terraform import azurerm_resource_group.imported /subscriptions/<subscription_id>/resourceGroups/tfworkshop-import-rg
```

### 6. Check the State
- Run:
  ```sh
  terraform state list
  ```
- Open `terraform.tfstate` to see how Terraform tracks resources.

### 7. Clean Up
- To remove the imported resource from state (does not delete in Azure):
  ```sh
  terraform state rm azurerm_resource_group.imported
  ```
- To destroy resources managed by Terraform:
  ```sh
  terraform destroy
  ```

---

## Quiz
1. What does `terraform import` do?
2. What is the purpose of the state file?
3. How do you remove a resource from Terraform state without deleting it in Azure?

---

**Proceed to Lab 6 once you have completed this lab!**
