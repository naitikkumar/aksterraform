data "azurerm_subnet" "subnet_det" {
  name                 = var.subnet1_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name_for_subnet
}

data "azurerm_subnet" "subnet_det1" {
  name                 = var.subnet2_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name_for_subnet
}
