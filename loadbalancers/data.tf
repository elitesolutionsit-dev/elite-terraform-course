
data "azurerm_client_config" "current" {}

data "azurerm_subscription" "primary" {}

data "azurerm_virtual_network" "vnet" {
  name                = local.existingvnet
  resource_group_name = local.existingvnetrg
}

data "azurerm_resource_group" "vnet_rg" {
  name = local.existingvnetrg
}