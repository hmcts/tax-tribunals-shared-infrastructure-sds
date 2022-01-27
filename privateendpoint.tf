data "azurerm_subnet" "petpostgres" {
  provider             = "azurerm.pet-aks"
  name                 = "pet_private_${local.petenv}"
  virtual_network_name = "pet_${local.petenv}_network"
  resource_group_name  = "pet_${local.petenv}_network_resource_group"
}

locals {
  petenv = var.env == "prod" || var.env == "stg" ? var.env : "dev"
}
resource "azurerm_resource_group" "petrg" {
  provider = "azurerm.pet-aks"
  name     = "${var.product}-${local.petenv}-endpoint-rg"
  location = var.location

}
resource "azurerm_private_endpoint" "petpostgres" {
  provider            = "azurerm.pet-aks"
  name                = "${var.product}-${local.petenv}-endpoint"
  location            = var.location
  resource_group_name = azurerm_resource_group.petrg.name
  subnet_id           = data.azurerm_subnet.petpostgres.id

  private_service_connection {
    name                           = "${var.product}-${local.petenv}-postgressdb"
    private_connection_resource_id = module.tt-database.id
    subresource_names              = ["postgresqlServer"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "postgres-endpoint-dnszonegroup"
    private_dns_zone_ids = ["/subscriptions/1baf5470-1c3e-40d3-a6f7-74bfbce4b348/resourceGroups/core-infra-intsvc-rg/providers/Microsoft.Network/privateDnsZones/privatelink.postgres.database.azure.com"]
  }
  tags = var.common_tags
}
