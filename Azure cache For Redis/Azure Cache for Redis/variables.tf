variable "location" {
  default = "west us"
}

variable "resource_group_name" {
    default = "redis-resource-group"
}

variable "storage_account_name" {
    default = "redisstorageaccount0987"
}

variable "storage_account_tier" {
    default = "Standard"
}

variable "storage_account_replication_type" {
    default = "GRS"
}

variable "redis_cache_name" {
     default = "rediscacheIMM8765"
}

variable "redis_cache_capacity" {
     default = "3"
}

variable "redis_cache_family" {
    default = "p"
}

variable "sku_name" {
    default = "Premium"
}

variable "rdp_backup_enabled" {
    default = "true"
}

variable "rdp_backup_frequeny"{
    default = "60"
}

variable "rdb_backup_max_snapshot_count" {
    default = "1" 
}