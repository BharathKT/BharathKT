# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "rg-dev" {
  name     = "rg-dev"
  location = "West us 3"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "example" {
  name                = "vnet-dev"
  resource_group_name = azurerm_resource_group.rg-dev.rg-dev
  location            = azurerm_resource_group.rg-dev.westus3
  address_space       = ["10.0.0.0/16"]
}