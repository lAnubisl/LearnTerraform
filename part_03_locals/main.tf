resource "azurerm_resource_group" "my_resource_group" {
  name     = local.resource_group_name
  location = var.location
}

resource "azurerm_static_site" "frontend" {
  name                = local.website_name
  resource_group_name = azurerm_resource_group.my_resource_group.name
  location            = azurerm_resource_group.my_resource_group.location
  sku_tier            = "Free"
}