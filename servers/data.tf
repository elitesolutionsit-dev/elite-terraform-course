
data "azurerm_client_config" "current" {}

data "azurerm_subscription" "primary" {}

data "azurerm_subnet" "backendnetwork" {
  name                 = "application_subnet"
  virtual_network_name = local.existingvnet
  resource_group_name  = local.existingvnetrg
}

data "azurerm_network_security_group" "nsg" {
  name                = "elite_devnsg"
  resource_group_name = local.existingvnetrg
}

data "azurerm_resource_group" "vnet_rg" {
  name = local.existingvnetrg
}