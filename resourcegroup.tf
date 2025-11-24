resource "azurerm_resource_group" "identity" {
  name     = "${var.location_short}-vetmed-rg"
  location = var.location
  tags     = var.tags
}