terraform {
  required_version = "1.23.0"

  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.product}-${var.env}"
  location = var.location
  tags     = var.common_tags
}