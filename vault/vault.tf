resource "azurerm_resource_group" "elitevault" {
  name     = "elitevault"
  location = lower("EASTUS2")
  provider = azurerm.vault
}

resource "azurerm_key_vault" "elitevault" {
  provider                    = azurerm.vault
  name                        = join("", ["elite", "dev", "mastervault"])
  location                    = azurerm_resource_group.elitevault.location
  resource_group_name         = azurerm_resource_group.elitevault.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "List"
    ]

    secret_permissions = [
      "Get", "Backup", "Delete", "List", "Purge", "Recover", "Restore", "Set",
    ]

    storage_permissions = [
      "Get", "List"
    ]
  }
}

## ------------------------------------------##
#Create KeyVault VM password for windows server

resource "random_password" "windows_server_password" {
  length  = 20
  special = false
}

## ------------------------------------------##
#Create KeyVault VM password for ssl
# resource "random_password" "ssl-password" {
#   length  = 11
#   special = false
# }

## ------------------------------------------##
#Create Key Vault Secretfor windows server
# resource "azurerm_key_vault_secret" "windows_server_password" {
#   name         = upper("windowsserverpassword")
#   value        = random_password.windows_server_password.result
#   key_vault_id = azurerm_key_vault.elitevault.id

#   depends_on = [azurerm_key_vault.elitevault]
# }

# ## ------------------------------------------##
# #Create Key Vault Secret for database
# resource "azurerm_key_vault_secret" "sql_server_password" {
#   name         = upper("msqlpassword")
#   value        = random_password.sql_server_password.result
#   key_vault_id = azurerm_key_vault.elitevault.id

#   depends_on = [azurerm_key_vault.elitevault]
# }

resource "azurerm_key_vault_secret" "ssl-password" {
  name         = "ssl-password"
  value        = random_password.ssl-password.result
  key_vault_id = azurerm_key_vault.elitevault.id

  depends_on = [azurerm_key_vault.elitevault]
}