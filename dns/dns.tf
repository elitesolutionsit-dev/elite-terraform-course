resource "azurerm_resource_group" "dns" {
  name     = local.dnsrg
  location = local.buildregion
}

resource "azurerm_dns_zone" "dns_zone" {
  name                = local.domainname
  resource_group_name = azurerm_resource_group.dns.name
  tags                = local.dns_tags
}

resource "azurerm_dns_txt_record" "dns_zone_record" {
  name                = "@"
  zone_name           = azurerm_dns_zone.dns_zone.name
  resource_group_name = azurerm_resource_group.dns.name
  ttl                 = 300

  record {
    value = "d684a0e1-0fbf-479a-87ca-e94553df7bed"
  }
  tags = local.dns_tags
}

resource "azurerm_dns_a_record" "record" {
  name                = "@"
  zone_name           = azurerm_dns_zone.dns_zone.name
  resource_group_name = azurerm_resource_group.dns.name
  ttl                 = 300
  records             = ["20.122.94.123"]
  tags                = local.dns_tags
}

resource "azurerm_dns_cname_record" "cname_record" {
  name                = var.cname
  zone_name           = azurerm_dns_zone.dns_zone.name
  resource_group_name = azurerm_resource_group.dns.name
  ttl                 = 300
  record              = var.record
  tags                = local.dns_tags
}