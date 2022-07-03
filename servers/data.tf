
data "azurerm_client_config" "current" {}

data "azurerm_subscription" "primary" {}

data "azuread_client_config" "current" {}

data "azurerm_subnet" "backendnetwork" {
  name                 = "application_subnet"
  virtual_network_name = local.existingvnet
  resource_group_name  = local.existingvnetrg
}

data "azurerm_network_security_group" "nsg" {
  name                = local.existingnsg
  resource_group_name = local.existingvnetrg
}

data "azurerm_resource_group" "vnet_rg" {
  name = local.existingvnetrg
}

# data "azurerm_key_vault_secret" "exisitingkeyvaultsecret" {
#   name         = local.exisitingkeyvaultsecret
#   key_vault_id = data.azurerm_key_vault.existingkeyvault.id
# }

# data "azurerm_key_vault" "existingkeyvault" {
#   name                = local.existingkeyvault
#   resource_group_name = local.existingkeyvaultrg
# }

data "azurerm_virtual_machine" "existingvm" {
  name                = local.existinglinuxvm
  resource_group_name = local.existinglinuxvmrg
}
