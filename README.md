# devops-team-portfolio
TechCrush - Static Website Project

# Title -TechCrush | Cloud Computing Team

# Project 1: Azure Static Website Deployment (Personal Project)

## Objective
To deploy a unique, automated static website to Azure Blob Storage using the Azure CLI and GitHub Actions for CI/CD.

## Project Structure
- `src/`: Contains the website source code (`index.html`, `error.html`).
- `deploy.sh`: Bash script to provision Azure resources and perform the initial upload.
- `.github/workflows/main.yml`: Automation for continuous deployment.

## Deployment Instructions

### 1. Prerequisites
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) installed.
- A GitHub repository with your `AZURE_CREDENTIALS` added as a Secret.

### 2. Manual Provisioning (Bash)
To set up the infrastructure for the first time, run the deployment script:
```bash
chmod +x deploy.sh
./deploy.sh
