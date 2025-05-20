# Terraform Azure Workshop Cheat Sheet

A comprehensive reference for common commands, troubleshooting, and best practices for all labs.

---

## General Commands

| Action                  | Command                                 |
|-------------------------|-----------------------------------------|
| Initialize Terraform    | `terraform init`                         |
| Format code             | `terraform fmt`                          |
| Validate configuration  | `terraform validate`                     |
| Plan changes            | `terraform plan -out=tfplan`             |
| Apply changes           | `terraform apply tfplan`                 |
| Destroy resources       | `terraform destroy`                      |
| Show state              | `terraform state list`                   |
| Show resource details   | `terraform state show <address>`         |
| Import resource         | `terraform import <address> <id>`        |
| Remove from state       | `terraform state rm <address>`           |
| Output values           | `terraform output`                       |
| Clean .terraform dir    | `rm -rf .terraform`                      |
| Workspace list          | `terraform workspace list`               |
| Create workspace        | `terraform workspace new <name>`         |
| Select workspace        | `terraform workspace select <name>`      |


---

## Common Issues & Fixes

### Authentication & Provider Issues
- **Error: No valid credential sources found**
  ```bash
  # Log in to Azure CLI
  az login
  
  # Set the subscription (if you have multiple)
  az account set --subscription="SUBSCRIPTION_ID"
  ```

- **Provider not found / version errors**
  - Run `terraform init -upgrade`
  - Check your `required_providers` block:
    ```hcl
    terraform {
      required_providers {
        azurerm = {
          source  = "hashicorp/azurerm"
          version = "~> 3.0"  # Specify your version
        }
      }
    }
    ```

### State Management
- **Error acquiring the state lock**
  ```bash
  # List locked state files
  terraform state list
  
  # Force unlock (use with caution)
  terraform force-unlock LOCK_ID
  ```

- **State is out of sync with actual infrastructure**
  ```bash
  # Refresh state
  terraform refresh
  
  # Or import existing resource
  terraform import <resource_type>.<name> <resource_id>
  ```

### Resource Management
- **Resource name already exists**
  - Add random suffix:
    ```hcl
    resource "random_id" "suffix" {
      byte_length = 4
    }
    
    resource "azurerm_storage_account" "example" {
      name = "storage${random_id.suffix.hex}"
      # ...
    }
    ```

- **Resource in use / cannot delete**
  - Check dependencies in Azure Portal
  - Use `terraform state list` to find dependent resources
  - Try `-target` flag to destroy specific resources first

### Debugging
- **Enable detailed logging**
  ```bash
  export TF_LOG=DEBUG
  terraform apply
  ```

- **Check Azure activity logs**
  ```bash
  az monitor activity-log list --resource-group <rg_name>
  ```

---

## Lab-Specific Tips

### Lab 1: Resource Group
- Resource group names must be unique within your subscription.
- Use consistent naming conventions: `rg-<app>-<env>-<region>`

### Lab 2: Networking
- VNet and subnet address spaces must not overlap with existing networks.
- Use `az network vnet list` to check existing networks.

### Lab 3: Virtual Machine
- Avoid hardcoding credentials; use Azure Key Vault or environment variables.
- VM sizes may not be available in every region. Check with:
  ```bash
  az vm list-sizes --location eastus --output table
  ```

### Lab 4: Storage
- Storage account names must be globally unique (3-24 chars, lowercase alphanumeric).
- Use random suffixes for development environments.

### Lab 5: Imports & State
- Get resource IDs from Azure Portal or CLI:
  ```bash
  az resource show --name <resource_name> --resource-group <rg_name> --resource-type <resource_type> --query id -o tsv
  ```
- Always backup state before manual edits.

### Lab 6: Tagging
- Use consistent tagging strategy across resources.
- Common tags: Environment, Owner, Project, CostCenter.
- Enforce tags using Azure Policy in production.

### Lab 7: Modules
- Module paths are relative to the root module.
- Use version constraints for production modules.
- Document module inputs/outputs clearly.

---

## Best Practices

1. **Version Control**
   - Never commit `.tfstate` files
   - Use `.gitignore` for sensitive files
   ```gitignore
   *.tfstate
   *.tfstate.*
   .terraform/
   *.tfvars
   *.tfvars.json
   ```

2. **State Management**
   - Use remote state (Azure Storage, Terraform Cloud)
   - Enable state locking
   - Regularly backup state files

3. **Security**
   - Use Azure Key Vault for secrets
   - Implement least privilege access
   - Enable Azure Defender for Cloud recommendations

4. **Cost Control**
   - Use tags for cost allocation
   - Set up budget alerts
   - Clean up unused resources

---

## Quick Links
- [Terraform Documentation](https://www.terraform.io/docs/index.html)
- [Azure Provider Docs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Azure CLI Docs](https://learn.microsoft.com/en-us/cli/azure/)
- [Terraform Best Practices](https://www.terraform-best-practices.com/)
- [Azure Naming Conventions](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming)

---

## Getting Help

1. **Self-Help**
   ```bash
   # Get detailed error information
   terraform plan -detailed-exitcode
   
   # Debug specific resource
   terraform state show <resource_address>
   ```

2. **Check Azure Status**
   ```bash
   # Check Azure status
   az vm get-instance-view --ids $(az vm list --query '[].id' -o tsv)
   ```

3. **When Stuck**
   - Check the [Troubleshooting Guide](https://www.terraform.io/docs/cli/commands/plan.html#troubleshooting)
   - Search [Terraform GitHub Issues](https://github.com/hashicorp/terraform/issues)
   - Ask for help in the workshop!

Remember: Always test changes in a non-production environment first!
