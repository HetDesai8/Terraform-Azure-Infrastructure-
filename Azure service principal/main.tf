terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

data "azurerm_client_config" "current" {
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


# Create an Azure Active Directory application
resource "azuread_application" "example" {
  display_name = var.app_name
  # multi_tenant = false
}

# Create a service principal for the application
resource "azuread_service_principal" "example" {
  application_id = azuread_application.example.application_id
}

# Assign a role to the service principal
resource "azurerm_role_assignment" "example" {
  scope              = "/subscriptions/${var.subscription_id}"
  # role_definition_id = var.role_definition_id
  role_definition_name = var.role_definition_name
  principal_id       = azuread_service_principal.example.object_id
}
