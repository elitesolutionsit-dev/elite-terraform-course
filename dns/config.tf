terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.10.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "4.21.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true
  features {}
}

provider "aws" {
  alias  = "certificate"
  region = "us-east-1"
}