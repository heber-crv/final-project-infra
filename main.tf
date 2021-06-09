data "azurerm_resource_group" "myRG" {
  name = "heber-cervantes"
}

module "azure" {
  source        = "./modules/azure/"
  client_id     = var.client_id
  client_secret = var.client_secret
}

module "k8s" {
  source                 = "./modules/k8s/"
  host                   = module.azure.host
  client_certificate     = base64decode(module.azure.client_certificate)
  client_key             = base64decode(module.azure.client_key)
  cluster_ca_certificate = base64decode(module.azure.cluster_ca_certificate)
}
