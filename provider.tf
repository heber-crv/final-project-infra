terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.60.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  #  skip_provider_registration = "true"

  features {}
}
