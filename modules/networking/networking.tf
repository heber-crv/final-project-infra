resource "azurerm_virtual_network" "main-vnet" {
  name                = "vnet1"
  location            = var.rg_location
  resource_group_name = var.rg_name
  address_space       = ["10.30.0.0/16"]
}

#Creates the main subnet
resource "azurerm_subnet" "main-subnet" {
  name                 = "subnet1"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.main-vnet.name
  address_prefixes     = ["10.30.1.0/24"]
}

resource "azurerm_public_ip" "lb-public-ip" {
  name                = "loadBalancer"
  resource_group_name = var.rg_name
  location            = var.rg_location
  allocation_method   = "Static"
  sku                 = "Standard"
}
