# Terraform-Azure-Infrastructure-
Creating Infra such as "Azure Cache for Redis" "Azure Remote Backend" "Azure Service Principal"

# Remote Backend
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0, <= 1.4.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =2.46.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.49.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.46.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.tfstate](https://registry.terraform.io/providers/hashicorp/azurerm/3.49.0/docs/resources/resource_group) | resource |
| [azurerm_storage_account.tfstate](https://registry.terraform.io/providers/hashicorp/azurerm/3.49.0/docs/resources/storage_account) | resource |
| [azurerm_storage_container.tfstate](https://registry.terraform.io/providers/hashicorp/azurerm/3.49.0/docs/resources/storage_container) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | n/a | `string` | `"Standard"` | no |
| <a name="input_allow_blob_public_access"></a> [allow\_blob\_public\_access](#input\_allow\_blob\_public\_access) | n/a | `string` | `"false"` | no |
| <a name="input_container_access_type"></a> [container\_access\_type](#input\_container\_access\_type) | n/a | `string` | `"private"` | no |
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | n/a | `string` | `"tfstate"` | no |
| <a name="input_key"></a> [key](#input\_key) | n/a | `string` | `"terraform.tfstate"` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"East US"` | no |
| <a name="input_replication_type"></a> [replication\_type](#input\_replication\_type) | n/a | `string` | `"LRS"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `"tfstate"` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | n/a | `string` | `"tfstate643764qap"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map` | <pre>{<br>  "environment": "staging"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backend_tfstate_resource_group"></a> [backend\_tfstate\_resource\_group](#output\_backend\_tfstate\_resource\_group) | n/a |
| <a name="output_backend_tfstate_storage_account_name"></a> [backend\_tfstate\_storage\_account\_name](#output\_backend\_tfstate\_storage\_account\_name) | n/a |
| <a name="output_backend_tfstate_storage_container_name"></a> [backend\_tfstate\_storage\_container\_name](#output\_backend\_tfstate\_storage\_container\_name) | n/a |


# Azure Service Principal

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0, <= 1.4.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =2.46.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.49.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.46.0 |

## Modules

No modules.

## Resources

| Name | Type |
hetdesai6789@Hets-MacBook-Pro Azure service principal % terraform-docs markdown .   
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.36.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_application.example](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application) | resource |
| [azuread_service_principal.example](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal) | resource |
| [azurerm_resource_group.example](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/resource_group) | resource |
| [azurerm_role_assignment.example](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/role_assignment) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | The name of the Azure AD application. | `string` | `"immdemo-service"` | no |
| <a name="input_role_definition_name"></a> [role\_definition\_name](#input\_role\_definition\_name) | The ID of the role definition to assign to the Service Principal. | `string` | `"Contributor"` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The subscription ID where the Service Principal will be created. | `string` | `"93da44cd-c21c-4bd3-aace-cdb75896b292"` | no |

## Outputs

No outputs.

#Azure Cache For Redis

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_redis_cache.redis_cache](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/redis_cache) | resource |
| [azurerm_resource_group.resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_storage_account.storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"west us"` | no |
| <a name="input_rdb_backup_max_snapshot_count"></a> [rdb\_backup\_max\_snapshot\_count](#input\_rdb\_backup\_max\_snapshot\_count) | n/a | `string` | `"1"` | no |
| <a name="input_rdp_backup_enabled"></a> [rdp\_backup\_enabled](#input\_rdp\_backup\_enabled) | n/a | `string` | `"true"` | no |
| <a name="input_rdp_backup_frequeny"></a> [rdp\_backup\_frequeny](#input\_rdp\_backup\_frequeny) | n/a | `string` | `"60"` | no |
| <a name="input_redis_cache_capacity"></a> [redis\_cache\_capacity](#input\_redis\_cache\_capacity) | n/a | `string` | `"3"` | no |
| <a name="input_redis_cache_family"></a> [redis\_cache\_family](#input\_redis\_cache\_family) | n/a | `string` | `"p"` | no |
| <a name="input_redis_cache_name"></a> [redis\_cache\_name](#input\_redis\_cache\_name) | n/a | `string` | `"rediscacheIMM8765"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `"redis-resource-group"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | n/a | `string` | `"Premium"` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | n/a | `string` | `"redisstorageaccount0987"` | no |
| <a name="input_storage_account_replication_type"></a> [storage\_account\_replication\_type](#input\_storage\_account\_replication\_type) | n/a | `string` | `"GRS"` | no |
| <a name="input_storage_account_tier"></a> [storage\_account\_tier](#input\_storage\_account\_tier) | n/a | `string` | `"Standard"` | no |

## Outputs

No outputs.
