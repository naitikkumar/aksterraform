terraform {

  required_version = ">=0.14"
  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.51.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "1.4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "terrform_rg"
    storage_account_name = "terraformtfstateyd"
    container_name       = "statefiles"
    key                  = "uat.terraform.tfstate"
  }
}

provider "azurerm" {
  # Configuration options
  features {

  }
}

provider "azuread" {
  # Configuration options
}

provider "random" {
  # Configuration options
}