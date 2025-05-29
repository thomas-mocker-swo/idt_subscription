resource "azurerm_resource_group" "identity" {
  name     = module.naming.resource_names["idt"].resource_group
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "tmocker" {
  name     = module.naming.resource_names["tmockernew"].resource_group
  location = var.location
  tags     = var.tags
}