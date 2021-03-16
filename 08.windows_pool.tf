resource "azurerm_kubernetes_cluster_node_pool" "win" {
  enable_auto_scaling   = true
  availability_zones    = [1, 2, 3]
  max_count             = 3
  min_count             = 1
  node_count            = 1
  os_disk_size_gb       = 30
  mode                  = "User"
  orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  os_type               = "Windows"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  name                  = "win01"
  vm_size               = "Standard_DS2_v2"
  node_labels = {
    "nodepool-type" = "user"
    "environment"   = "production"
    "nodepoolos"    = "Windows"
    "app"           = "dotnet-apps"
  }
  tags = {
    "nodepool-type" = "user"
    "environment"   = "production"
    "nodepoolos"    = "Windows"
    "app"           = "dotnet-apps"
  }
}