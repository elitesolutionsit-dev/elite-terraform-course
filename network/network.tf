resource "azurerm_resource_group" "elite_general_network" {
  name     = "elite_general_network"
  location = "EASTUS2"
}

resource "azurerm_network_security_group" "elite_devnsg" {
  name                = "elite_devnsg"
  location            = azurerm_resource_group.elite_general_network.location
  resource_group_name = azurerm_resource_group.elite_general_network.name
}

resource "azurerm_virtual_network" "elitedev_vnet" {
  name                = "elitedev_vnet"
  location            = azurerm_resource_group.elite_general_network.location
  resource_group_name = azurerm_resource_group.elite_general_network.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "database-subnet"
    address_prefix = "10.0.1.0/24"
    security_group = azurerm_network_security_group.elite_devnsg.id
  }

  subnet {
    name           = "application-subnet"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.elite_devnsg.id
  }

  tags = {
    environment = "Development"
    company = "elitesolutionsit"
    ManagedWith = "terraform"
  }
}
