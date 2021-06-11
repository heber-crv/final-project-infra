data "azurerm_resource_group" "myRG" {
  name = "heber-cervantes"
}

/*resource "azurerm_virtual_network" "main-vnet" {
  name                = "vnet1"
  location            = data.azurerm_resource_group.myRG.location
  resource_group_name = data.azurerm_resource_group.myRG.name
  address_space       = ["10.30.0.0/16"]
}*/

#Creates the main subnet
/*resource "azurerm_subnet" "main-subnet" {
  name                 = "subnet1"
  resource_group_name  = data.azurerm_resource_group.myRG.name
  virtual_network_name = azurerm_virtual_network.main-vnet.name
  address_prefixes     = ["10.30.1.0/24"]
}*/

/*resource "azurerm_public_ip" "cluster-public-ip" {
  name                = "cluster-ip"
  resource_group_name = data.azurerm_resource_group.myRG.name
  location            = data.azurerm_resource_group.myRG.location
  allocation_method   = "Static"
  sku                 = "Standard"
}*/

resource "azurerm_kubernetes_cluster" "cluster1" {
  name                = "cluster1"
  location            = data.azurerm_resource_group.myRG.location
  resource_group_name = data.azurerm_resource_group.myRG.name
  dns_prefix          = "dns1"

  default_node_pool {
    name       = "default"
    vm_size    = "Standard_D2_v2"
    type       = "VirtualMachineScaleSets"
    node_count = 1
    #    enable_node_public_ip = true
    #    vnet_subnet_id        = azurerm_subnet.main-subnet.id
  }

  identity {
    type = "SystemAssigned"
  }

  linux_profile {
    admin_username = "azureuser"
    ssh_key {
      key_data = var.ssh_key
    }
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "Standard"
    /*   load_balancer_profile {
      outbound_ip_address_ids = [azurerm_public_ip.cluster-public-ip.id]
    }*/
  }
}
