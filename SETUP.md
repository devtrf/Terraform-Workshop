# Terraform Workshop Setup Guide

Welcome to the Azure Terraform Workshop! Before starting the labs, please follow these steps to set up your environment.

## 1. Prerequisites
- A computer with internet access
- An [Azure account](https://azure.microsoft.com/free/)

## 2. Install Terraform
- Download Terraform: https://developer.hashicorp.com/terraform/install
- Follow the installation instructions for your OS.
- Verify installation:
  ```sh
  terraform -version
  ```

## 3. Install Azure CLI
- Download and install Azure CLI: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli
- Verify installation:
  ```sh
  az --version
  ```

## 4. Authenticate to Azure
- Open a terminal and run:
  ```sh
  az login
  ```
- Follow the instructions in the browser to sign in.

## 5. (Optional) VS Code & Terraform Extension
- Install [Visual Studio Code](https://code.visualstudio.com/)
- Install the [Terraform extension for VS Code](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform)

You're now ready to start the labs
