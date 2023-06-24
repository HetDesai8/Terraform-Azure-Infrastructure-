output "backend_tfstate_resource_group" {
  value = azurerm_resource_group.tf_state_rg.name
}

output "backend_tfstate_storage_account_name" {
  value = azurerm_storage_account.tf_state_storage_account.name
}

output "backend_tfstate_storage_container_name" {
  value = azurerm_storage_container.tf_state_storage_container.name
}