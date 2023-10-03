resource "azurerm_resource_group" "my_resource_group" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_static_site" "frontend" {
  name                = var.website_name
  resource_group_name = azurerm_resource_group.my_resource_group.name
  location            = azurerm_resource_group.my_resource_group.location
  sku_tier            = var.websute_sku
}