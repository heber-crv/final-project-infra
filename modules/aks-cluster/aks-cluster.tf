resource "azurerm_kubernetes_cluster" "cluster1" {
  name                = "cluster1"
  location            = var.rg_location
  resource_group_name = var.rg_name
  dns_prefix          = "dns1"

  default_node_pool {
    name           = "default"
    vm_size        = "Standard_D2_v2"
    type           = "VirtualMachineScaleSets"
    node_count     = 1
    vnet_subnet_id = var.subnet_id
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
    network_plugin    = "azure"
    load_balancer_sku = "Standard"
    /*
    load_balancer_profile {
      outbound_ip_prefix_ids = [var.public_ip_id]
      outbound_ip_address_ids = [var.public_ip_id]
    }
    */
  }
}
