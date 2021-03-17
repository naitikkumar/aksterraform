variable "ssh_key" {
  description = "location of ssh key"
 # default     = "C:/keys/id_rsa.pub" because we are using it for azuer devops
}

variable "windows_admin_username" {
  type        = string
  description = "windows admin username for aks cluster"
  default     = "aksadmin"
}

variable "windows_admin_password" {

  default     = "M@ttic0t11032021"
  description = "windows admin password for aks cluster"
}

variable "linux_admin_username" {
  default     = "aksadmin"
  description = "linux admin username for aks cluster"
}

#resource-group

variable "resource_group_name" {
  default     = "az-aks-terraform"
  description = "enter resource group name"
}

variable "resource_group_location" {
  default     = "eastus"
  description = "enter resource group location"
}

variable "env" {
  default     = "uat"
  description = "enter env for cluster"
}

#azure ad group

variable "group" {
  default     = "az_aks_cluster_admin_grp"
  description = "azure ad group display name"
}

#aks cluster

variable "node_rsg" {
  default     = "aks_cluster_node_pool"
  description = "azure ad node resource group"
}

variable "clustername" {
  default     = "myakscluster"
  description = "azure kubernetes cluster"
}

#data source for subnet

variable "resource_group_name_for_subnet" {
  type        = string
  default     = "mydns"
  description = "enter name of resource which as virtual network"
}

variable "virtual_network_name" {
  default     = "aks-vnet"
  type        = string
  description = "enter name of virtual network name"
}

variable "subnet1_name" {
  default     = "default"
  type        = string
  description = "enter name of subnet1"
}

variable "subnet2_name" {
  default     = "virtualnodes"
  type        = string
  description = "enter name of subnet2"
}