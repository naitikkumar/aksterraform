resource "azurerm_kubernetes_cluster_node_pool" "sys" {
  enable_auto_scaling   = true
  availability_zones    = [1, 2, 3]
  max_count             = 3
  min_count             = 1
  node_count            = 1
  os_disk_size_gb       = 30
  mode                  = "System"
  orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  os_type               = "Linux"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  name                  = "system01"
  vm_size               = "Standard_DS2_v2"
  node_labels = {
    "nodepool-type" = "System"
    "environment"   = "production"
    "nodepoolos"    = "linux"
    "app"           = "system-apps"
  }
  tags = {
    "nodepool-type" = "Sytem"
    "environment"   = "production"
    "nodepoolos"    = "linux"
    "app"           = "system-apps"
  }
}