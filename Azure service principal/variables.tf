variable "app_name" {
  description = "The name of the Azure AD application."
  type        = string
  default = "immdemo-service"
}

variable "subscription_id" {
  description = "The subscription ID where the Service Principal will be created."
  type        = string
  default = "93da44cd-c21c-4bd3-aace-cdb75896b292"
}

variable "role_definition_name" {
  description = "The ID of the role definition to assign to the Service Principal."
  type        = string
  default = "Contributor"
}

resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "West Europe"
}