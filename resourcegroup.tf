resource "azurerm_resource_group" "identity" {
  name     = "${var.location_short}-identity-rg"
  location = var.location
  tags     = var.tags
}