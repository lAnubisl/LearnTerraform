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
  features {}
}