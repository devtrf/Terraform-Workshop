# Terraform Azure Workshop Cheat Sheet

A quick reference for common commands, troubleshooting, and gotchas for all labs.

---

## General Commands

| Action                  | Command                                 |
|-------------------------|-----------------------------------------|
| Initialize Terraform    | `terraform init`                         |
| Format code             | `terraform fmt`                          |
| Validate configuration  | `terraform validate`                     |
| Plan changes            | `terraform plan`                         |
| Apply changes           | `terraform apply`                        |
| Destroy resources       | `terraform destroy`                      |
| Show state              | `terraform state list`                   |
| Import resource         | `terraform import <address> <id>`        |
| Remove from state       | `terraform state rm <address>`           |
| Output values           | `terraform output`                       |
| Clean .terraform dir    | `rm -rf .terraform`                      |

---

## Common Issues & Fixes

- **Provider not found / version errors:**
  - Run `terraform init` again.
  - Check your `provider` block and required versions.
- **Authentication errors:**
  - Make sure you ran `az login` and are in the right subscription.
  - Use `az account show` to check current subscription.
- **Resource name already exists:**
  - Some Azure resources (like storage accounts) require globally unique names. Use random suffixes or change the name.
- **Resource in use / cannot delete:**
  - Check dependencies in Azure Portal.
- **Terraform state issues:**
  - Backup your `terraform.tfstate` before manual edits.
  - Use `terraform state` commands to inspect and fix state.
- **Syntax errors:**
  - Run `terraform validate` and check for typos or missing braces.

---

## Lab-Specific Tips

### Lab 1: Resource Group
- Resource group names must be unique within your subscription.

### Lab 2: Networking
- VNet and subnet address spaces must not overlap with existing networks.

### Lab 3: Virtual Machine
- Avoid hardcoding passwords; use variables or Azure Key Vault for real scenarios.
- VM sizes may not be available in every region.

### Lab 4: Storage
- Storage account names must be globally unique and only use lowercase letters and numbers.
- Use the `random_integer` resource for unique names.

### Lab 5: Imports & State
- Get the resource ID from Azure Portal for import commands.
- Example: `/subscriptions/<sub_id>/resourceGroups/<rg_name>`

### Lab 6: Tagging
- Tags are key-value pairs; use them for cost management and organization.

### Lab 7: Modules
- Module paths are relative to your root module.
- Run `terraform get` if you add or change modules.

---

## Quick Links
- [Terraform Docs](https://developer.hashicorp.com/terraform/docs)
- [Azure Provider Docs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Azure CLI Docs](https://learn.microsoft.com/en-us/cli/azure/)

---

If you get stuck, try to:
1. Read the error message carefully.
2. Run `terraform validate` or `terraform plan` to debug.
3. Check the Azure Portal for resource status.
4. Ask for help!
