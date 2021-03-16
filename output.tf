#resource group details
output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.id
}

output "resource_group_location" {
  value = azurerm_resource_group.rg.location
}

#azuread details
output "azuread_name" {
  value = azuread_group.grp.name
}

output "azuread_id" {
  value = azuread_group.grp.id
}

#loganalitics details
output "log_id" {
  value = azurerm_log_analytics_workspace.lgw.id
}

output "log_name" {
  value = azurerm_log_analytics_workspace.lgw.name
}

output "log_loc" {
  value = azurerm_log_analytics_workspace.lgw.location
}

#cluster details
output "cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "cluster_id" {
  value = azurerm_kubernetes_cluster.aks.id
}


#datasource for aks versions

output "aks_cluster_kubernetes_version" {
  value = azurerm_kubernetes_cluster.aks.kubernetes_version
}

output "aks_all_versions" {
  value = data.azurerm_kubernetes_service_versions.current.versions
}

output "aks_current_version" {
  value = data.azurerm_kubernetes_service_versions.current.latest_version
}

#datasource for virtual network for aks

output "subnet1_name" {
  value = data.azurerm_subnet.subnet_det.name
}

output "subnet1_id" {
  value = data.azurerm_subnet.subnet_det.id
}

output "subnet2_name" {
  value = data.azurerm_subnet.subnet_det1.name
}

output "subnet2_id" {
  value = data.azurerm_subnet.subnet_det1.id
}