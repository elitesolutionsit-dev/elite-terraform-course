
data "azurerm_client_config" "current" {}

data "azurerm_subscription" "primary" {}

data "azurerm_virtual_network" "vnet" {
  name                = local.existingvnet
  resource_group_name = local.existingvnetrg
}

data "azurerm_resource_group" "vnet_rg" {
  name = local.existingvnetrg
}

data "azurerm_network_security_group" "nsg" {
  name                = local.existingnsg
  resource_group_name = local.existingvnetrg
}

data "azurerm_route_table" "rtb" {
  name                = local.existingrtb
  resource_group_name = local.existingvnetrg
}

data "azurerm_key_vault_secret" "secret" {
  name         = "ssl-password"
  key_vault_id = data.azurerm_key_vault.existing.id
}

data "azurerm_key_vault" "existing" {
  name                = "elitedevkeyvaultmaster"
  resource_group_name = "elitevault"
}
