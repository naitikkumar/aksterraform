resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.clustername
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  dns_prefix          = "${azurerm_resource_group.rg.name}-cluster-dns"
  node_resource_group = "${azurerm_resource_group.rg.name}-node-rg"
  default_node_pool {
    name                 = "systempool"
    availability_zones   = [1, 2, 3]
    enable_auto_scaling  = true
    max_count            = 3
    min_count            = 1
    os_disk_size_gb      = 30
    vm_size              = "Standard_DS2_v2"
    type                 = "VirtualMachineScaleSets"
    vnet_subnet_id       = data.azurerm_subnet.subnet_det.id
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    node_labels = {
      "nodepool-type" = "system"
      "environment"   = "dev"
      "nodepoolos"    = "linux"
      "app"           = "system-apps"
    }
    tags = {
      "nodepool-type" = "system"
      "environment"   = "dev"
      "nodepoolos"    = "linux"
      "app"           = "system-apps"
    }
  }
  linux_profile {
    admin_username = var.linux_admin_username
    ssh_key {
      key_data = file(var.ssh_key)
    }
  }
  windows_profile {
    admin_username = var.windows_admin_username
    admin_password = var.windows_admin_password
  }
  network_profile {
    dns_service_ip     = "10.0.0.10"
    network_plugin     = "azure"
    service_cidr       = "10.0.0.0/16"
    load_balancer_sku  = "Standard"
    docker_bridge_cidr = "172.17.0.1/16"
  }
  role_based_access_control {
    enabled = true
    azure_active_directory {
      admin_group_object_ids = [azuread_group.grp.object_id]
      managed                = true
    }
  }
  addon_profile {
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = azurerm_log_analytics_workspace.lgw.id
    }
    azure_policy {
      enabled = true
    }
    aci_connector_linux {
      enabled     = true
      subnet_name = var.subnet2_name #virtual nodes enabled , give aciconnectorlinux-myakscluster managed identity network contributor on vnet
    }
  }
  identity {
    type = "SystemAssigned"
  }
  tags = {
    "env" = var.env
  }

}