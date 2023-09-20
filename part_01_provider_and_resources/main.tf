terraform {
  required_version = ">= 1.5.7"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.73.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "my_resource_group" {
  name     = "rg-learn-terraform-part-01"
  location = "westeurope"
}

resource "azurerm_static_site" "frontend" {
  name                = "stapp-learn-terraform-part-01"
  resource_group_name = "rg-learn-terraform-part-01"
  location            = "westeurope"
  sku_tier            = "Free"
  depends_on = [ azurerm_resource_group.my_resource_group ]
}