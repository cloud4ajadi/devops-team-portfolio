#!/bin/bash

# Variables - Change these to ensure uniqueness
RESOURCE_GROUP="jamiu_project_rg"
LOCATION="canadacentral"
STORAGE_ACCOUNT="jamiustaticwebsitestore" # Ensures a unique name
INDEX_DOC="index.html"

echo "Creating Resource Group..."
az group create --name $RESOURCE_GROUP --location $LOCATION

echo "Creating Storage Account..."
az storage account create \
    --name $STORAGE_ACCOUNT \
    --resource-group $RESOURCE_GROUP \
    --location $LOCATION \
    --sku Standard_LRS \
    --kind StorageV2

echo "Enabling Static Website Hosting..."
az storage blob service-properties update \
    --account-name $STORAGE_ACCOUNT \
    --static-website \
    --404-document error.html \
    --index-document $INDEX_DOC

echo "Uploading files to \$web container..."
az storage blob upload-batch \
    --account-name $STORAGE_ACCOUNT \
    --source ./src \
    --destination '$web' \
    --overwrite

# Output the primary endpoint
az storage account show \
    --name $STORAGE_ACCOUNT \
    --resource-group $RESOURCE_GROUP \
    --query "primaryEndpoints.web" \
    --output tsv