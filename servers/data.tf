
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

# data "azurerm_virtual_machine" "existingvm" {
#   name                = local.existinglinuxvm
#   resource_group_name = local.existinglinuxvmrg
# }

# ----- Run Userdata ----- ##
# data "cloudinit_config" "userdata" {
#   gzip          = true
#   base64_encode = true

#   part {
#     content_type = "text/x-shellscript"
#     filename     = "apache"
#     content = templatefile("./templates/apache.tpl",

#       {
#         db_username     = var.db_username
#         db_password     = var.db_password
#         db_name         = var.db_name
#         mssql_sqlserver = data.azurerm_mssql_server.elite_resourcesdb.fully_qualified_domain_name
#         appgateway      = data.azurerm_application_gateway.appgw.id
#     })
#   }
# }

# data "azurerm_mssql_server" "elite_resourcesdb" {
#   name                = "elitedevsqlserver"
#   resource_group_name = "elite_resourcesdb"
# }

# data "azurerm_application_gateway" "appgw" {
#   name                = "elite-devgateway"
#   resource_group_name = "elite-appgw-dev"
# }