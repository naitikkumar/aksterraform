# Datasource to get latest azure aks latest versions
data "azurerm_kubernetes_service_versions" "current" {
  location        = azurerm_resource_group.rg.location
  include_preview = false
}