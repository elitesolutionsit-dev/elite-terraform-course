
resource "azurerm_network_security_rule" "RDP" {
  name                        = "RDP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = var.source_address_prefix
  destination_address_prefix  = var.destination_address_prefix
  resource_group_name         = azurerm_resource_group.elite_general_network.name
  network_security_group_name = azurerm_network_security_group.elite_devnsg.name
}

resource "azurerm_network_security_rule" "DB" {
  name                        = "DB"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3306 "
  source_address_prefix       = var.source_address_prefix
  destination_address_prefix  = var.destination_address_prefix
  resource_group_name         = azurerm_resource_group.elite_general_network.name
  network_security_group_name = azurerm_network_security_group.elite_devnsg.name
}