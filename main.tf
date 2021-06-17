data "azurerm_resource_group" "myRG" {
  name = "heber-cervantes"
}

module "networking" {
  source = "./modules/networking/"
  rg_name     = data.azurerm_resource_group.myRG.name
  rg_location = data.azurerm_resource_group.myRG.location
}

module "aks-cluster" {
  source    = "./modules/aks-cluster/"
  subnet_id = module.networking.subnet_id
  ssh_key       = var.ssh_key
  rg_name       = data.azurerm_resource_group.myRG.name
  rg_location   = data.azurerm_resource_group.myRG.location
}
