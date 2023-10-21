terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.73.0"
    }
    github = {
      source  = "integrations/github"
      version = "= 5.39.0"
    }
  }
  required_version = ">= 1.5.7"
}

provider "azurerm" {
  features {}
}
provider "github" {
  token = var.GITHUB_TOKEN
}