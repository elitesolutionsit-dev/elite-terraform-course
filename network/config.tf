terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.10.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  # skip_provider_registration = true
  # subscription_id            = "efd562d4-aa33-4a87-8c45-2181407ed796"
  features {}
}

provider "azurerm" {
  alias = "vault"
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}