variable "create_resource_group" {
  description = "Whether to create resource group and use it for all networking resources"
  default     = true
}

variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = "demo-rg"
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = "East Us"
}

# variable "log_analytics_workspace_name" {
#   description = "The name of log analytics workspace name"
#   default     = null
# }

variable "redis_instance_name" {
  description = "The name of the Redis instance"
  default     = "het-redis"
}

variable "redis_family" {
  type        = map(any)
  description = "The SKU family/pricing group to use. Valid values are `C` (for `Basic/Standard` SKU family) and `P` (for `Premium`)"
  default = {
    Basic    = "C"
    Standard = "C"
    Premium  = "P"
  }
}

variable "redis_server_settings" {
  type = map(object({
    capacity                      = number
    sku_name                      = string
    enable_non_ssl_port           = optional(bool)
    minimum_tls_version           = optional(string)
    private_static_ip_address     = optional(string)
    public_network_access_enabled = optional(string)
    replicas_per_master           = optional(number)
    shard_count                   = optional(number)
    zones                         = optional(list(string))
  }))
  description = "optional redis server setttings for both Premium and Standard/Basic SKU"
  default = {
    redis_cache = {
      capacity            = "3"
      sku_name            = "Basic"
      enable_non_ssl_port = "false"
      minimum_tls_version = "1.0"
    }
  }
}

variable "patch_schedule" {
  type = object({
    day_of_week    = string
    start_hour_utc = number
  })
  description = "The window for redis maintenance. The Patch Window lasts for 5 hours from the `start_hour_utc` "
  default     = null
}

variable "subnet_id" {
  description = "The ID of the Subnet within which the Redis Cache should be deployed. Only available when using the Premium SKU"
  default     = null
}

variable "redis_configuration" {
  type = object({
    enable_authentication           = optional(bool)
    maxmemory_reserved              = optional(number)
    maxmemory_delta                 = optional(number)
    maxmemory_policy                = optional(string)
    maxfragmentationmemory_reserved = optional(number)
    notify_keyspace_events          = optional(string)
  })
  description = "Configuration for the Redis instance"
  default = {
    enable_authentication           = "true"
    maxmemory_reserved              = "2"
    maxmemory_delta                 = "2"
    maxmemory_policy                = "volatile-lru"
    maxfragmentationmemory_reserved = "2"
  }
}

variable "storage_account_name" {
  description = "The name of the storage account name"
  default     = "hetdesai"
}

variable "storage_account_kind" {
  description = "what kind of storage account to use"
  default     = "StorageV2"

}

variable "storage_account_tier" {
  description = "what kind of storage account tier you should use"
  default     = "Standard"
}

variable "storage_account_replication_type" {
  description = "what kind of replication you want to use"
  default     = "GRS"
}

variable "storage_account_enable_https_traffic_only" {
  description = "do you only want to allow https traffic to access"
  default     = "true"
}

variable "storage_account_min_tls_version" {
  description = "minimum tls version required"
  default     = "TLS1_2"

}


variable "enable_data_persistence" {
  description = "Enable or disbale Redis Database Backup. Only supported on Premium SKU's"
  default     = true
}

variable "data_persistence_backup_frequency" {
  description = "The Backup Frequency in Minutes. Only supported on Premium SKU's. Possible values are: `15`, `30`, `60`, `360`, `720` and `1440`"
  default     = 60
}

variable "data_persistence_backup_max_snapshot_count" {
  description = "The maximum number of snapshots to create as a backup. Only supported for Premium SKU's"
  default     = 1
}

variable "firewall_rules" {
  description = "Range of IP addresses to allow firewall connections."
  type = map(object({
    start_ip = string
    end_ip   = string
  }))
  default = null
}

variable "enable_private_endpoint" {
  description = "Manages a Private Endpoint to Azure database for Redis"
  default     = false
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  default     = ""
}

variable "private_service_connection_name" {
  default = "rediscache-privatelink"
}

variable "private_service_connection_subresource_name" {
  default = ["redisCache"]
}

variable "azurerm_private_dns_zone_name" {
  default = "privatelink.redis.cache.windows.net"
}

variable "azurerm_private_dns_zone_virtual_network_link_name" {
  default = "vnet-private-zone-link"
}

variable "existing_private_dns_zone" {
  description = "Name of the existing private DNS zone"
  default     = null
}

variable "private_subnet_address_prefix" {
  description = "The name of the subnet for private endpoints"
  default     = null
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}