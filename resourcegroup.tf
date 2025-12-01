resource "azurerm_resource_group" "identity" {
  name     = "${var.location_short}-vetmed-rg"
  location = var.location
  tags     = var.tags
}



resource "azurerm_resource_group" "mgt" {
  name     = "${var.location_short}-mgt-rg"
  location = var.location
  tags     = var.tags
}


resource "azurerm_resource_group" "law" {
  name     = "${var.location_short}-law-rg"
  location = var.location
  tags     = var.tags
}


resource "azurerm_resource_group" "dc" {
  name     = "${var.location_short}-dc-rg"
  location = var.location
  tags     = var.tags
}




resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = var.location
  resource_group_name = azurerm_resource_group.identity.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  tags = var.tags
}