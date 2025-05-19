# Lab 2: Networking — Virtual Network & Subnet

## Objective
Deploy an Azure Virtual Network (VNet) and a Subnet using Terraform, and learn about resource dependencies.

---

## Steps

### 1. Navigate to Lab Directory
```sh
cd ../lab2-networking
```

### 2. Create `main.tf`
Paste the following into `main.tf`:
```hcl
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "workshop" {
  name     = "tfworkshop-networking-rg"
  location = "East US"
}

resource "azurerm_virtual_network" "workshop_vnet" {
  name                = "tfworkshop-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.workshop.location
  resource_group_name = azurerm_resource_group.workshop.name
}

resource "azurerm_subnet" "workshop_subnet" {
  name                 = "tfworkshop-subnet"
  resource_group_name  = azurerm_resource_group.workshop.name
  virtual_network_name = azurerm_virtual_network.workshop_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
```

### 3. Initialize and Apply
```sh
terraform init
terraform apply
```
Type `yes` when prompted.

### 4. Verify in Azure Portal
- Check the resource group, VNet, and subnet in the [Azure Portal](https://portal.azure.com/).

---

## Quiz
1. What resource type is used to create a subnet in Azure?
2. How does Terraform know the order to create resources?
3. What is the address space for the VNet in this lab?

---

## Cleanup (Optional)
```sh
terraform destroy
```
Type `yes` when prompted.

---

**Proceed to Lab 3 once you have completed this lab!**
