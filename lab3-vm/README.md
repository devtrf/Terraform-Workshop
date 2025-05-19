# Lab 3: Compute — Deploy a Virtual Machine

## Objective
Deploy a Linux Virtual Machine (VM) in Azure using Terraform, connected to your subnet.

---

## Steps

### 1. Navigate to Lab Directory
```sh
cd ../lab3-vm
```

### 2. Create `main.tf`
Paste the following into `main.tf`:
```hcl
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "workshop" {
  name     = "tfworkshop-vm-rg"
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

resource "azurerm_network_interface" "workshop_nic" {
  name                = "tfworkshop-nic"
  location            = azurerm_resource_group.workshop.location
  resource_group_name = azurerm_resource_group.workshop.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.workshop_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "workshop_vm" {
  name                = "tfworkshop-vm"
  resource_group_name = azurerm_resource_group.workshop.name
  location            = azurerm_resource_group.workshop.location
  size                = "Standard_B1s"
  admin_username      = "azureuser"
  network_interface_ids = [azurerm_network_interface.workshop_nic.id]

  admin_password = "P@ssw0rd1234!"   # For demo only. Use SSH keys or secrets in production!

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "tfworkshop-osdisk"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}

output "vm_public_ip" {
  value = azurerm_linux_virtual_machine.workshop_vm.public_ip_address
}
```

### 3. Initialize and Apply
```sh
terraform init
terraform apply
```
Type `yes` when prompted.

### 4. Verify in Azure Portal
- Look for the VM, NIC, VNet, and subnet in the [Azure Portal](https://portal.azure.com/).

---

## Quiz
1. What resource is used to create a Linux VM?
2. Why should you avoid hardcoding passwords in Terraform files?
3. How do you output a value from your Terraform configuration?

---

## Cleanup (Optional)
```sh
terraform destroy
```
Type `yes` when prompted.

---

**Proceed to Lab 4 once you have completed this lab!**
