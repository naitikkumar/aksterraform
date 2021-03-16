resource "random_string" "str" {
  length  = 4
  special = false
  lower   = true
  number  = true
  upper   = false
}
resource "azurerm_log_analytics_workspace" "lgw" {
  name                = "mylogworkspace${random_string.str.result}"
  sku                 = "PerGB2018"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tags = {
    "env" = var.env
  }
}