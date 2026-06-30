resource "azurerm_resource_group" "demo" {
  name     = "${var.location_short}-drv-rg"
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "demo_sqr" {
  name     = "${var.location_short}-sar-rg"
  location = var.location
  tags     = var.tags
}






