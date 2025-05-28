resource "azurerm_resource_group" "identity" {
  name     = module.naming.resource_names["idt"].resource_group
  location = var.location
  tags     = var.tags
}