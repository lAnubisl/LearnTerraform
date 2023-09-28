resource "azurerm_resource_group" "my_resource_group" {
  name     = local.resource_group_name
  location = var.location
}

module "frontend" {
  source                   = "./tf_modules/frontend"
  location                 = azurerm_resource_group.my_resource_group.location
  resource_group_name      = azurerm_resource_group.my_resource_group.name
  environment              = var.environment
}

module "backend" {
  source                   = "./tf_modules/backend"
  location                 = azurerm_resource_group.my_resource_group.location
  resource_group_name      = azurerm_resource_group.my_resource_group.name
  environment              = var.environment
}