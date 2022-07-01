resource "azurerm_resource_group" "dns" {
  name     = local.dnsrg
  location = local.buildregion
}

resource "azurerm_dns_zone" "dns_zone" {
  name                = local.domainname
  resource_group_name = azurerm_resource_group.dns.name
}