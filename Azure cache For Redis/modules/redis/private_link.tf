
#---------------------------------------------------------
# Private Link for Redis Server - Default is "false" 
#---------------------------------------------------------
# data "azurerm_virtual_network" "vnet01" {
#   count               = var.enable_private_endpoint ? 1 : 0
#   name                = var.virtual_network_name
#   resource_group_name = local.resource_group_name
# }

# resource "azurerm_subnet" "snet-ep" {
#   count                                          = var.enable_private_endpoint ? 1 : 0
#   name                                           = "snet-endpoint-shared-${local.location}"
#   resource_group_name                            = local.resource_group_name
#   virtual_network_name                           = data.azurerm_virtual_network.vnet01.0.name
#   address_prefixes                               = var.private_subnet_address_prefix
#   enforce_private_link_endpoint_network_policies = true
# }

resource "azurerm_private_endpoint" "pep1" {
  count               = var.enable_private_endpoint ? 1 : 0
  name                = format("%s-private-endpoint", element([for n in azurerm_redis_cache.main : n.name], 0))
  location            = local.location
  resource_group_name = local.resource_group_name
  subnet_id           = azurerm_subnet.snet-ep.0.id
  tags                = merge({ "Name" = format("%s-private-endpoint", element([for n in azurerm_redis_cache.main : n.name], 0)) }, var.tags, )

  private_service_connection {
    name                           = var.private_service_connection_name
    is_manual_connection           = false
    private_connection_resource_id = element([for i in azurerm_redis_cache.main : i.id], 0)
    subresource_names              = var.private_service_connection_subresource_name
  }
}

data "azurerm_private_endpoint_connection" "private-ip1" {
  count               = var.enable_private_endpoint ? 1 : 0
  name                = azurerm_private_endpoint.pep1.0.name
  resource_group_name = local.resource_group_name
  depends_on          = [azurerm_redis_cache.main]
}

resource "azurerm_private_dns_zone" "dnszone1" {
  count               = var.existing_private_dns_zone == null && var.enable_private_endpoint ? 1 : 0
  name                = var.azurerm_private_dns_zone_name
  resource_group_name = local.resource_group_name
  tags                = merge({ "Name" = format("%s", "RedisCache-Private-DNS-Zone") }, var.tags, )
}

# resource "azurerm_private_dns_zone_virtual_network_link" "vent-link1" {
#   count                 = var.existing_private_dns_zone == null && var.enable_private_endpoint ? 1 : 0
#   name                  = var.azurerm_private_dns_zone_virtual_network_link_name
#   resource_group_name   = local.resource_group_name
#   private_dns_zone_name = azurerm_private_dns_zone.dnszone1.0.name
#   virtual_network_id    = data.azurerm_virtual_network.vnet01.0.id
#   tags                  = merge({ "Name" = format("%s", "vnet-private-zone-link") }, var.tags, )
# }

resource "azurerm_private_dns_a_record" "arecord1" {
  count               = var.enable_private_endpoint ? 1 : 0
  name                = element([for n in azurerm_redis_cache.main : n.name], 0)
  zone_name           = var.existing_private_dns_zone == null ? azurerm_private_dns_zone.dnszone1.0.name : var.existing_private_dns_zone
  resource_group_name = local.resource_group_name
  ttl                 = 300
  records             = [data.azurerm_private_endpoint_connection.private-ip1.0.private_service_connection.0.private_ip_address]
}

