terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.73.0"
    }
  }
  required_version = ">= 1.5.7"
}

provider "azurerm" {
  storage_use_azuread = true
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg_samples_azure_storage_account_access_key_disabled"
  location = "westeurope"
}

resource "azurerm_storage_account" "sa" {
  name                          = "sasamples234f1f22a3"
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_resource_group.rg.location
  account_tier                  = "Standard"
  account_replication_type      = "LRS"
  shared_access_key_enabled     = false
  public_network_access_enabled = false
  sftp_enabled                  = false
  is_hns_enabled                = true

  tags = {
    environment = "samples"
  }
}