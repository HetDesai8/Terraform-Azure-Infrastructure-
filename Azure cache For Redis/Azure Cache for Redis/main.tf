provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}


resource "azurerm_redis_cache" "redis_cache" {
  name                = var.redis_cache_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  capacity            = var.redis_cache_capacity
  family              = var.redis_cache_family
  sku_name            = var.sku_name
  enable_non_ssl_port = false

  redis_configuration {
    rdb_backup_enabled            = var.rdp_backup_enabled
    rdb_backup_frequency          = var.rdp_backup_frequeny
    rdb_backup_max_snapshot_count = var.rdb_backup_max_snapshot_count
    rdb_storage_connection_string = azurerm_storage_account.storage_account.primary_blob_connection_string
  }
}