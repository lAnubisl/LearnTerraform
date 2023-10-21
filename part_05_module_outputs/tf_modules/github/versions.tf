terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "= 5.39.0"
    }
  }
  required_version = ">= 1.5.7"
}