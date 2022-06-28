
# resource "azurerm_network_security_rule" "SSH" {
#   name                        = "SSH"
#   priority                    = 100
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_range      = "22"
#   source_address_prefix       = var.source_address_prefix
#   destination_address_prefix  = var.destination_address_prefix
#   resource_group_name         = data.azurerm_resource_group.vnet_rg.name
#   network_security_group_name = data.azurerm_network_security_group.nsg.name
# }

# resource "azurerm_network_security_rule" "DB" {
#   name                        = "DB"
#   priority                    = 101
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_range      = "3306"
#   source_address_prefix       = var.source_address_prefix
#   destination_address_prefix  = var.destination_address_prefix
#   resource_group_name         =data.azurerm_resource_group.vnet_rg.name
#   network_security_group_name = data.azurerm_network_security_group.nsg.name
# }