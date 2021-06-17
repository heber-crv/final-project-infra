terraform {
  backend "azurerm" {
    resource_group_name  = "heber-cervantes"
    storage_account_name = "zammadinfra"
    container_name       = "iac"
    key                  = "terraform.tfstate"
  }
}
