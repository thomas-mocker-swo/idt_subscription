resource "azurerm_resource_group" "demo" {
  name     = "${var.location_short}-drv-rg"
  location = var.location
  tags     = var.tags
}





