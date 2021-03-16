resource "azuread_group" "grp" {
  display_name = var.group
  description  = "aks cluster for admins"
}