# Azure Terraform Workshop

Welcome to the Azure Terraform Workshop! This workshop is designed for absolute beginners and will guide you through deploying Azure resources using Terraform.

## Labs Overview

- **Lab 1:** Resource Group — Basics of Terraform and deploying your first resource group
- **Lab 2:** Networking — Deploy a Virtual Network and Subnet
- **Lab 3:** Compute — Deploy a Virtual Machine
- **Lab 4:** Storage — Deploy a Storage Account and Blob Container
- **Lab 5:** Imports & State — Import existing resources and understand state
- **Lab 6:** Tagging — Organize resources with tags and naming conventions
- **Lab 7:** Modules — Reuse code with Terraform modules

Each lab is in its own folder with a step-by-step `README.md` and starter Terraform files.

## Getting Started

1. **Setup your environment:**
   - See the [SETUP.md](./SETUP.md) for instructions on installing Terraform, Azure CLI, and authenticating to Azure.
2. **Complete labs in order:**
   - Enter each lab folder (`lab1-resource-group`, `lab2-networking`, etc.)
   - Follow the instructions in each `README.md`
   - Complete the quiz at the end of each lab
   - Use the cleanup instructions to destroy resources after each lab

## Repository Structure

```
Terraform Workshop/
│
├── SETUP.md         # Environment setup instructions
├── README.md        # This file
├── .gitignore       # Ignore Terraform state and sensitive files
│
├── lab1-resource-group/
├── lab2-networking/
├── lab3-vm/
├── lab4-storage/
├── lab5-imports-state-cleanup/
├── lab6-tagging/
└── lab7-modules/
```

## License
MIT
